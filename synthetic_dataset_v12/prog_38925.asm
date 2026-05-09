; DESCRIPTION: Renders a cyan line between points (489, 243) and (287, 246).
; PLAN: r0=489(x1), r1=243(y1), r2=287(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 243
LDI r2, 287
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
