; DESCRIPTION: Draws a yellow line from (330, 194) to (69, 219).
; PLAN: r0=330(x1), r1=194(y1), r2=69(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 194
LDI r2, 69
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
