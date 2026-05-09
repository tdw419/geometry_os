; DESCRIPTION: Renders a white line between points (489, 206) and (444, 220).
; PLAN: r0=489(x1), r1=206(y1), r2=444(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 206
LDI r2, 444
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
