; DESCRIPTION: Renders a black line between points (70, 162) and (33, 98).
; PLAN: r0=70(x1), r1=162(y1), r2=33(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 162
LDI r2, 33
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
