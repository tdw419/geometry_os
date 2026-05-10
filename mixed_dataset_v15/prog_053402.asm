; DESCRIPTION: Renders a black line between points (187, 253) and (33, 97).
; PLAN: r0=187(x1), r1=253(y1), r2=33(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 253
LDI r2, 33
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
