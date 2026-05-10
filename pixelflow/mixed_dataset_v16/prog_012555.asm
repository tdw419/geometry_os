; DESCRIPTION: Draws a yellow line from (107, 46) to (307, 102).
; PLAN: r0=107(x1), r1=46(y1), r2=307(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 46
LDI r2, 307
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
