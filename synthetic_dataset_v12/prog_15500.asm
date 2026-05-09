; DESCRIPTION: Renders a green line between points (331, 150) and (206, 216).
; PLAN: r0=331(x1), r1=150(y1), r2=206(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 150
LDI r2, 206
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
