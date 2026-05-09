; DESCRIPTION: Places a red line segment connecting (195, 230) to (255, 179).
; PLAN: r0=195(x1), r1=230(y1), r2=255(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 230
LDI r2, 255
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
