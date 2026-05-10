; DESCRIPTION: Places a yellow 24x43 rectangle at position (82, 96).
; PLAN: r0=82(x), r1=96(y), r2=24(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 96
LDI r2, 24
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
