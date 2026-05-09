; DESCRIPTION: Renders a blue line between points (179, 251) and (335, 215).
; PLAN: r0=179(x1), r1=251(y1), r2=335(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 251
LDI r2, 335
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
