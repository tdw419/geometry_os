; DESCRIPTION: Draws a red line from (50, 255) to (2, 203).
; PLAN: r0=50(x1), r1=255(y1), r2=2(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 255
LDI r2, 2
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
