; DESCRIPTION: Draws a green line from (469, 75) to (20, 84).
; PLAN: r0=469(x1), r1=75(y1), r2=20(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 75
LDI r2, 20
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
