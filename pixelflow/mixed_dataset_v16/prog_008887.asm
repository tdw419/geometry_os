; DESCRIPTION: Draws a red line from (440, 31) to (35, 28).
; PLAN: r0=440(x1), r1=31(y1), r2=35(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 31
LDI r2, 35
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
