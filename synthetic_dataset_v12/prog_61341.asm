; DESCRIPTION: Places a black line segment connecting (171, 248) to (136, 208).
; PLAN: r0=171(x1), r1=248(y1), r2=136(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 248
LDI r2, 136
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
