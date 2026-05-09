; DESCRIPTION: Renders a black line between points (228, 218) and (107, 244).
; PLAN: r0=228(x1), r1=218(y1), r2=107(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 218
LDI r2, 107
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
