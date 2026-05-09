; DESCRIPTION: Renders a black line between points (13, 47) and (13, 164).
; PLAN: r0=13(x1), r1=47(y1), r2=13(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 47
LDI r2, 13
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
