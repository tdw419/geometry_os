; DESCRIPTION: Renders a black line between points (80, 68) and (206, 128).
; PLAN: r0=80(x1), r1=68(y1), r2=206(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 68
LDI r2, 206
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
