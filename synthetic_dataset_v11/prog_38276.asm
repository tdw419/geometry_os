; DESCRIPTION: Renders a green line between points (40, 138) and (186, 174).
; PLAN: r0=40(x1), r1=138(y1), r2=186(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 138
LDI r2, 186
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
