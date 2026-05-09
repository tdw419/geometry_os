; DESCRIPTION: Renders a black line between points (361, 253) and (470, 205).
; PLAN: r0=361(x1), r1=253(y1), r2=470(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 253
LDI r2, 470
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
