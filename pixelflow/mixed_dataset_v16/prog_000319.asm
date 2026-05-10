; DESCRIPTION: Renders a blue rectangular region spanning 35 by 80 at (25, 30).
; PLAN: r0=25(x), r1=30(y), r2=35(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 30
LDI r2, 35
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
