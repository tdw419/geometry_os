; DESCRIPTION: Places a green 96x47 rectangle at position (82, 43).
; PLAN: r0=82(x), r1=43(y), r2=96(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 43
LDI r2, 96
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
