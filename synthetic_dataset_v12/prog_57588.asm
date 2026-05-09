; DESCRIPTION: Draws a green line from (241, 69) to (203, 168).
; PLAN: r0=241(x1), r1=69(y1), r2=203(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 69
LDI r2, 203
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
