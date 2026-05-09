; DESCRIPTION: Draws a red line from (65, 68) to (135, 83).
; PLAN: r0=65(x1), r1=68(y1), r2=135(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 68
LDI r2, 135
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
