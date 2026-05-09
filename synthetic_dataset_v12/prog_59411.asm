; DESCRIPTION: Renders a yellow box of size 79x40 starting at (183, 85).
; PLAN: r0=183(x), r1=85(y), r2=79(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 85
LDI r2, 79
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
