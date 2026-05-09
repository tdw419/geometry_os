; DESCRIPTION: Draws a red line from (132, 206) to (360, 72).
; PLAN: r0=132(x1), r1=206(y1), r2=360(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 206
LDI r2, 360
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
