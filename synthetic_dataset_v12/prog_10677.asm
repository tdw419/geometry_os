; DESCRIPTION: Draws a yellow line from (420, 223) to (236, 63).
; PLAN: r0=420(x1), r1=223(y1), r2=236(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 223
LDI r2, 236
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
