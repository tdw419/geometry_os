; DESCRIPTION: Renders a yellow line between points (444, 64) and (109, 231).
; PLAN: r0=444(x1), r1=64(y1), r2=109(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 64
LDI r2, 109
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
