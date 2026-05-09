; DESCRIPTION: Places a red line segment connecting (255, 197) to (95, 90).
; PLAN: r0=255(x1), r1=197(y1), r2=95(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 197
LDI r2, 95
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
