; DESCRIPTION: Renders a blue box of size 80x20 starting at (102, 200).
; PLAN: r0=102(x), r1=200(y), r2=80(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 200
LDI r2, 80
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
