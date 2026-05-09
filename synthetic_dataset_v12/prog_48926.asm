; DESCRIPTION: Draws a green line from (453, 95) to (482, 245).
; PLAN: r0=453(x1), r1=95(y1), r2=482(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 95
LDI r2, 482
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
