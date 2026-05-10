; DESCRIPTION: Draws a black line from (362, 97) to (197, 208).
; PLAN: r0=362(x1), r1=97(y1), r2=197(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 97
LDI r2, 197
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
