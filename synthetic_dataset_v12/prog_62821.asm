; DESCRIPTION: Renders a white line between points (412, 49) and (510, 144).
; PLAN: r0=412(x1), r1=49(y1), r2=510(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 49
LDI r2, 510
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
