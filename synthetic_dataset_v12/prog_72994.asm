; DESCRIPTION: Renders a purple line between points (154, 152) and (332, 202).
; PLAN: r0=154(x1), r1=152(y1), r2=332(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 152
LDI r2, 332
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
