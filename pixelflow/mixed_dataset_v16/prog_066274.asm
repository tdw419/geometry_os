; DESCRIPTION: Renders a white line between points (63, 47) and (91, 70).
; PLAN: r0=63(x1), r1=47(y1), r2=91(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 47
LDI r2, 91
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
