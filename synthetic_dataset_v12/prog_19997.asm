; DESCRIPTION: Draws a green line from (10, 198) to (436, 27).
; PLAN: r0=10(x1), r1=198(y1), r2=436(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 198
LDI r2, 436
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
