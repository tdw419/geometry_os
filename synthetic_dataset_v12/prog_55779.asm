; DESCRIPTION: Draws a red line from (386, 65) to (136, 218).
; PLAN: r0=386(x1), r1=65(y1), r2=136(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 65
LDI r2, 136
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
