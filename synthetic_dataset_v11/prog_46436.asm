; DESCRIPTION: Renders a purple box of size 16x78 starting at (178, 33).
; PLAN: r0=178(x), r1=33(y), r2=16(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 33
LDI r2, 16
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
