; DESCRIPTION: Renders a white line between points (259, 170) and (206, 219).
; PLAN: r0=259(x1), r1=170(y1), r2=206(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 170
LDI r2, 206
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
