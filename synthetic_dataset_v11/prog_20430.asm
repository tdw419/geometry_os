; DESCRIPTION: Renders a black line between points (103, 47) and (212, 46).
; PLAN: r0=103(x1), r1=47(y1), r2=212(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 47
LDI r2, 212
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
