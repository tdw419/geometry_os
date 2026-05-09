; DESCRIPTION: Renders a green line between points (144, 57) and (145, 198).
; PLAN: r0=144(x1), r1=57(y1), r2=145(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 57
LDI r2, 145
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
