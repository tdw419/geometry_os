; DESCRIPTION: Renders a black line between points (255, 91) and (10, 29).
; PLAN: r0=255(x1), r1=91(y1), r2=10(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 91
LDI r2, 10
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
