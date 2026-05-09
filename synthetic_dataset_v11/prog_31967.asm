; DESCRIPTION: Draws a green line from (222, 203) to (250, 173).
; PLAN: r0=222(x1), r1=203(y1), r2=250(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 203
LDI r2, 250
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
