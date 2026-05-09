; DESCRIPTION: Draws a red line from (151, 5) to (255, 179).
; PLAN: r0=151(x1), r1=5(y1), r2=255(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 5
LDI r2, 255
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
