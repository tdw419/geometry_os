; DESCRIPTION: Renders a green line between points (255, 79) and (147, 186).
; PLAN: r0=255(x1), r1=79(y1), r2=147(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 79
LDI r2, 147
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
