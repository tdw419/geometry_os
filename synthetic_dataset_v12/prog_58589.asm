; DESCRIPTION: Draws a green line from (362, 186) to (24, 198).
; PLAN: r0=362(x1), r1=186(y1), r2=24(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 186
LDI r2, 24
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
