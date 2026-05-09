; DESCRIPTION: Draws a yellow line from (469, 203) to (394, 70).
; PLAN: r0=469(x1), r1=203(y1), r2=394(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 203
LDI r2, 394
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
