; DESCRIPTION: Draws a yellow line from (111, 185) to (387, 63).
; PLAN: r0=111(x1), r1=185(y1), r2=387(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 185
LDI r2, 387
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
