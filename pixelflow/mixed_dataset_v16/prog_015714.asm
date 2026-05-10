; DESCRIPTION: Draws a yellow line from (196, 108) to (177, 39).
; PLAN: r0=196(x1), r1=108(y1), r2=177(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 108
LDI r2, 177
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
