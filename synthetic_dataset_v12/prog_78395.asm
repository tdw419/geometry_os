; DESCRIPTION: Draws a green line from (47, 60) to (52, 56).
; PLAN: r0=47(x1), r1=60(y1), r2=52(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 60
LDI r2, 52
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
