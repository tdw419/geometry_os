; DESCRIPTION: Renders a yellow line between points (63, 106) and (168, 196).
; PLAN: r0=63(x1), r1=106(y1), r2=168(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 106
LDI r2, 168
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
