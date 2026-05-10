; DESCRIPTION: Renders a black line between points (187, 198) and (370, 34).
; PLAN: r0=187(x1), r1=198(y1), r2=370(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 198
LDI r2, 370
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
