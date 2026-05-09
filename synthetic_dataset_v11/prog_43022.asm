; DESCRIPTION: Renders a blue box of size 71x54 starting at (160, 172).
; PLAN: r0=160(x), r1=172(y), r2=71(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 172
LDI r2, 71
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
