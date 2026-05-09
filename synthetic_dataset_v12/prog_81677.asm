; DESCRIPTION: Draws a yellow line from (361, 39) to (234, 12).
; PLAN: r0=361(x1), r1=39(y1), r2=234(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 39
LDI r2, 234
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
