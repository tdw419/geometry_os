; DESCRIPTION: Renders a green line between points (510, 251) and (104, 255).
; PLAN: r0=510(x1), r1=251(y1), r2=104(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 251
LDI r2, 104
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
