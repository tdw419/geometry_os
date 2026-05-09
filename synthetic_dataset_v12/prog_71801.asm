; DESCRIPTION: Renders a blue box of size 111x70 starting at (237, 123).
; PLAN: r0=237(x), r1=123(y), r2=111(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 123
LDI r2, 111
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
