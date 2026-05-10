; DESCRIPTION: Renders a black line between points (221, 206) and (144, 109).
; PLAN: r0=221(x1), r1=206(y1), r2=144(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 206
LDI r2, 144
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
