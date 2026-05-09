; DESCRIPTION: Renders a purple line between points (415, 27) and (189, 112).
; PLAN: r0=415(x1), r1=27(y1), r2=189(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 27
LDI r2, 189
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
