; DESCRIPTION: Draws a yellow line from (401, 86) to (97, 194).
; PLAN: r0=401(x1), r1=86(y1), r2=97(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 86
LDI r2, 97
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
