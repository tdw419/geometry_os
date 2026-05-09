; DESCRIPTION: Renders a blue line between points (255, 175) and (195, 83).
; PLAN: r0=255(x1), r1=175(y1), r2=195(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 175
LDI r2, 195
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
