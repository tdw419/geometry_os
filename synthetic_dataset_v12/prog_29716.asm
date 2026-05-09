; DESCRIPTION: Renders a blue box of size 33x94 starting at (226, 32).
; PLAN: r0=226(x), r1=32(y), r2=33(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 32
LDI r2, 33
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
