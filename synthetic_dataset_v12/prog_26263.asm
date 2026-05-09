; DESCRIPTION: Renders a black line between points (470, 161) and (165, 26).
; PLAN: r0=470(x1), r1=161(y1), r2=165(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 161
LDI r2, 165
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
