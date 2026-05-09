; DESCRIPTION: Renders a black line between points (71, 177) and (271, 252).
; PLAN: r0=71(x1), r1=177(y1), r2=271(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 177
LDI r2, 271
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
