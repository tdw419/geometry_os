; DESCRIPTION: Renders a yellow line segment connecting (320, 121) to (104, 20).
; PLAN: r0=320(x1), r1=121(y1), r2=104(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 121
LDI r2, 104
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
