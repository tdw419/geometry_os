; DESCRIPTION: Renders a black line between points (464, 128) and (22, 207).
; PLAN: r0=464(x1), r1=128(y1), r2=22(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 128
LDI r2, 22
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
