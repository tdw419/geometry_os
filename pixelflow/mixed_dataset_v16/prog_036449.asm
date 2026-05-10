; DESCRIPTION: Renders a black line between points (243, 34) and (160, 152).
; PLAN: r0=243(x1), r1=34(y1), r2=160(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 34
LDI r2, 160
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
