; DESCRIPTION: Draws a yellow line from (362, 176) to (426, 198).
; PLAN: r0=362(x1), r1=176(y1), r2=426(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 176
LDI r2, 426
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
