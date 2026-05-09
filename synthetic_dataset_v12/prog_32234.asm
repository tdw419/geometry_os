; DESCRIPTION: Renders a green line between points (255, 64) and (251, 22).
; PLAN: r0=255(x1), r1=64(y1), r2=251(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 64
LDI r2, 251
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
