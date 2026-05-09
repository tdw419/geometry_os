; DESCRIPTION: Renders a black line between points (459, 231) and (312, 60).
; PLAN: r0=459(x1), r1=231(y1), r2=312(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 231
LDI r2, 312
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
