; DESCRIPTION: Draws a yellow line from (362, 37) to (82, 225).
; PLAN: r0=362(x1), r1=37(y1), r2=82(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 37
LDI r2, 82
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
