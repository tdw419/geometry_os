; DESCRIPTION: Renders a green line between points (456, 47) and (172, 37).
; PLAN: r0=456(x1), r1=47(y1), r2=172(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 47
LDI r2, 172
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
