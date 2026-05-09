; DESCRIPTION: Renders a blue box of size 14x20 starting at (202, 77).
; PLAN: r0=202(x), r1=77(y), r2=14(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 77
LDI r2, 14
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
