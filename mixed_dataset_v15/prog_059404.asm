; DESCRIPTION: Draws a white line from (269, 24) to (163, 82).
; PLAN: r0=269(x1), r1=24(y1), r2=163(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 24
LDI r2, 163
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
