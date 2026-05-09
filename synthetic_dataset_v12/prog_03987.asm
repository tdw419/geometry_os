; DESCRIPTION: Draws a blue line from (261, 209) to (199, 203).
; PLAN: r0=261(x1), r1=209(y1), r2=199(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 209
LDI r2, 199
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
