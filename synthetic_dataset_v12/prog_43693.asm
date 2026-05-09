; DESCRIPTION: Draws a green line from (169, 90) to (128, 37).
; PLAN: r0=169(x1), r1=90(y1), r2=128(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 90
LDI r2, 128
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
