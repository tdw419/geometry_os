; DESCRIPTION: Renders a black line between points (489, 226) and (326, 21).
; PLAN: r0=489(x1), r1=226(y1), r2=326(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 226
LDI r2, 326
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
