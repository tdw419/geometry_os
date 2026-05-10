; DESCRIPTION: Draws a yellow line from (324, 11) to (230, 146).
; PLAN: r0=324(x1), r1=11(y1), r2=230(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 11
LDI r2, 230
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
