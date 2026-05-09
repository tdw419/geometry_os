; DESCRIPTION: Renders a yellow line between points (168, 181) and (12, 150).
; PLAN: r0=168(x1), r1=181(y1), r2=12(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 181
LDI r2, 12
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
