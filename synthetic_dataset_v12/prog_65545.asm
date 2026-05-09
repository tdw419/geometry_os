; DESCRIPTION: Renders a green line between points (188, 138) and (305, 34).
; PLAN: r0=188(x1), r1=138(y1), r2=305(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 138
LDI r2, 305
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
