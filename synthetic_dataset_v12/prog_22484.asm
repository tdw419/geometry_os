; DESCRIPTION: Renders a cyan line between points (287, 57) and (489, 252).
; PLAN: r0=287(x1), r1=57(y1), r2=489(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 57
LDI r2, 489
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
