; DESCRIPTION: Draws a blue line from (239, 66) to (327, 11).
; PLAN: r0=239(x1), r1=66(y1), r2=327(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 66
LDI r2, 327
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
