; DESCRIPTION: Draws a yellow line from (195, 21) to (113, 241).
; PLAN: r0=195(x1), r1=21(y1), r2=113(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 21
LDI r2, 113
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
