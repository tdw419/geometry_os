; DESCRIPTION: Renders a yellow line between points (213, 32) and (454, 3).
; PLAN: r0=213(x1), r1=32(y1), r2=454(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 32
LDI r2, 454
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
