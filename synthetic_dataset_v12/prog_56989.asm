; DESCRIPTION: Renders a yellow line between points (307, 163) and (38, 54).
; PLAN: r0=307(x1), r1=163(y1), r2=38(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 163
LDI r2, 38
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
