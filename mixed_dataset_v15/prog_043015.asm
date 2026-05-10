; DESCRIPTION: Draws a green line from (353, 167) to (151, 56).
; PLAN: r0=353(x1), r1=167(y1), r2=151(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 167
LDI r2, 151
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
