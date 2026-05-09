; DESCRIPTION: Draws a red line from (174, 244) to (6, 224).
; PLAN: r0=174(x1), r1=244(y1), r2=6(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 244
LDI r2, 6
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
