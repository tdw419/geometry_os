; DESCRIPTION: Draws a red line from (63, 95) to (224, 233).
; PLAN: r0=63(x1), r1=95(y1), r2=224(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 95
LDI r2, 224
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
