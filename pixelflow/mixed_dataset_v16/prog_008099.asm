; DESCRIPTION: Renders a yellow line between points (415, 32) and (9, 212).
; PLAN: r0=415(x1), r1=32(y1), r2=9(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 32
LDI r2, 9
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
