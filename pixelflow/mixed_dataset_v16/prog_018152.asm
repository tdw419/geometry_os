; DESCRIPTION: Renders a red line segment connecting (362, 141) to (374, 69).
; PLAN: r0=362(x1), r1=141(y1), r2=374(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 141
LDI r2, 374
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
