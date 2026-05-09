; DESCRIPTION: Draws a red line from (177, 153) to (185, 224).
; PLAN: r0=177(x1), r1=153(y1), r2=185(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 153
LDI r2, 185
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
