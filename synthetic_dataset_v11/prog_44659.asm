; DESCRIPTION: Renders a black line between points (207, 8) and (13, 70).
; PLAN: r0=207(x1), r1=8(y1), r2=13(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 8
LDI r2, 13
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
