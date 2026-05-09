; DESCRIPTION: Draws a red line from (224, 141) to (102, 87).
; PLAN: r0=224(x1), r1=141(y1), r2=102(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 141
LDI r2, 102
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
