; DESCRIPTION: Renders a white line segment connecting (14, 96) to (296, 127).
; PLAN: r0=14(x1), r1=96(y1), r2=296(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 96
LDI r2, 296
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
