; DESCRIPTION: Renders a blue box of size 32x97 starting at (409, 1).
; PLAN: r0=409(x), r1=1(y), r2=32(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 1
LDI r2, 32
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
