; DESCRIPTION: Renders a green line between points (489, 243) and (423, 167).
; PLAN: r0=489(x1), r1=243(y1), r2=423(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 243
LDI r2, 423
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
