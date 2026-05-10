; DESCRIPTION: Renders a white line between points (444, 253) and (511, 216).
; PLAN: r0=444(x1), r1=253(y1), r2=511(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 253
LDI r2, 511
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
