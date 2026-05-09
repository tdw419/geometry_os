; DESCRIPTION: Draws a white line from (209, 185) to (28, 232).
; PLAN: r0=209(x1), r1=185(y1), r2=28(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 185
LDI r2, 28
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
