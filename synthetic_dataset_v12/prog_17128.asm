; DESCRIPTION: Renders a yellow line between points (222, 21) and (509, 21).
; PLAN: r0=222(x1), r1=21(y1), r2=509(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 21
LDI r2, 509
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
