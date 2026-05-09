; DESCRIPTION: Places a green 105x23 rectangle at position (82, 93).
; PLAN: r0=82(x), r1=93(y), r2=105(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 93
LDI r2, 105
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
