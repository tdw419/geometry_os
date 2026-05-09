; DESCRIPTION: Draws a blue line from (454, 214) to (239, 249).
; PLAN: r0=454(x1), r1=214(y1), r2=239(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 214
LDI r2, 239
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
