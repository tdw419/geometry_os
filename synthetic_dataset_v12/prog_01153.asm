; DESCRIPTION: Renders a green line between points (425, 47) and (22, 174).
; PLAN: r0=425(x1), r1=47(y1), r2=22(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 47
LDI r2, 22
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
