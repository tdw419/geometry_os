; DESCRIPTION: Renders a black line between points (154, 231) and (188, 200).
; PLAN: r0=154(x1), r1=231(y1), r2=188(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 231
LDI r2, 188
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
