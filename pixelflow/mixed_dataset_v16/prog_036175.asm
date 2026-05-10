; DESCRIPTION: Renders a red line segment connecting (217, 193) to (392, 22).
; PLAN: r0=217(x1), r1=193(y1), r2=392(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 193
LDI r2, 392
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
