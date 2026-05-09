; DESCRIPTION: Renders a black line between points (367, 152) and (157, 22).
; PLAN: r0=367(x1), r1=152(y1), r2=157(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 152
LDI r2, 157
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
