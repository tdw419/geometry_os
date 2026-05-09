; DESCRIPTION: Renders a green line between points (127, 255) and (373, 106).
; PLAN: r0=127(x1), r1=255(y1), r2=373(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 255
LDI r2, 373
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
