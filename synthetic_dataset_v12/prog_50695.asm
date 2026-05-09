; DESCRIPTION: Renders a white line between points (44, 231) and (175, 234).
; PLAN: r0=44(x1), r1=231(y1), r2=175(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 231
LDI r2, 175
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
