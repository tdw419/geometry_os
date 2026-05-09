; DESCRIPTION: Draws a yellow line from (204, 237) to (197, 87).
; PLAN: r0=204(x1), r1=237(y1), r2=197(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 237
LDI r2, 197
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
