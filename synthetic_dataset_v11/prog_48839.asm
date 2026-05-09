; DESCRIPTION: Renders a yellow line between points (37, 47) and (198, 16).
; PLAN: r0=37(x1), r1=47(y1), r2=198(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 47
LDI r2, 198
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
