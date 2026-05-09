; DESCRIPTION: Renders a yellow line between points (307, 176) and (25, 54).
; PLAN: r0=307(x1), r1=176(y1), r2=25(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 176
LDI r2, 25
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
