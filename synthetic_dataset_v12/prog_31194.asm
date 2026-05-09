; DESCRIPTION: Draws a black line from (253, 124) to (213, 148).
; PLAN: r0=253(x1), r1=124(y1), r2=213(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 124
LDI r2, 213
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
