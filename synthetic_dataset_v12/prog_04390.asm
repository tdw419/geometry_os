; DESCRIPTION: Draws a yellow line from (497, 45) to (309, 197).
; PLAN: r0=497(x1), r1=45(y1), r2=309(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 45
LDI r2, 309
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
