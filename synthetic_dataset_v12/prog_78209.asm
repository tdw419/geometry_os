; DESCRIPTION: Draws a yellow line from (467, 198) to (309, 125).
; PLAN: r0=467(x1), r1=198(y1), r2=309(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 198
LDI r2, 309
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
