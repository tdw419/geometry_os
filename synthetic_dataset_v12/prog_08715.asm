; DESCRIPTION: Renders a magenta line between points (270, 38) and (372, 86).
; PLAN: r0=270(x1), r1=38(y1), r2=372(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 38
LDI r2, 372
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
