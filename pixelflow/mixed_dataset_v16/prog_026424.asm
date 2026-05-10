; DESCRIPTION: Renders a red line segment connecting (195, 69) to (198, 200).
; PLAN: r0=195(x1), r1=69(y1), r2=198(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 69
LDI r2, 198
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
