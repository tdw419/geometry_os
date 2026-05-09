; DESCRIPTION: Renders a black line between points (60, 120) and (128, 22).
; PLAN: r0=60(x1), r1=120(y1), r2=128(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 120
LDI r2, 128
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
