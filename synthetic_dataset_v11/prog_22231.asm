; DESCRIPTION: Draws a red line from (135, 112) to (115, 49).
; PLAN: r0=135(x1), r1=112(y1), r2=115(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 112
LDI r2, 115
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
