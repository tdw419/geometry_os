; DESCRIPTION: Draws a yellow line from (58, 107) to (63, 125).
; PLAN: r0=58(x1), r1=107(y1), r2=63(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 107
LDI r2, 63
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
