; DESCRIPTION: Draws a blue line from (11, 239) to (117, 11).
; PLAN: r0=11(x1), r1=239(y1), r2=117(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 239
LDI r2, 117
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
