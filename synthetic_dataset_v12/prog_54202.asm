; DESCRIPTION: Renders a white line between points (191, 244) and (489, 32).
; PLAN: r0=191(x1), r1=244(y1), r2=489(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 244
LDI r2, 489
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
