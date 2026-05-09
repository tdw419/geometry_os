; DESCRIPTION: Renders a white line between points (21, 58) and (188, 153).
; PLAN: r0=21(x1), r1=58(y1), r2=188(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 58
LDI r2, 188
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
