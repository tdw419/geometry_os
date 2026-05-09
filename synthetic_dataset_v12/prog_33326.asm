; DESCRIPTION: Renders a green line between points (304, 8) and (489, 86).
; PLAN: r0=304(x1), r1=8(y1), r2=489(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 8
LDI r2, 489
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
