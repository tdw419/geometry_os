; DESCRIPTION: Draws a blue line from (12, 239) to (56, 172).
; PLAN: r0=12(x1), r1=239(y1), r2=56(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 239
LDI r2, 56
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
