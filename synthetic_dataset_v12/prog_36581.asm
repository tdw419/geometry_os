; DESCRIPTION: Draws a yellow line from (10, 129) to (149, 48).
; PLAN: r0=10(x1), r1=129(y1), r2=149(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 129
LDI r2, 149
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
