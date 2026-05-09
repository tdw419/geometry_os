; DESCRIPTION: Renders a yellow line between points (193, 63) and (269, 33).
; PLAN: r0=193(x1), r1=63(y1), r2=269(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 63
LDI r2, 269
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
