; DESCRIPTION: Places a black line segment connecting (253, 237) to (113, 124).
; PLAN: r0=253(x1), r1=237(y1), r2=113(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 237
LDI r2, 113
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
