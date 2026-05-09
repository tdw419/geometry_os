; DESCRIPTION: Draws a yellow line from (128, 18) to (497, 182).
; PLAN: r0=128(x1), r1=18(y1), r2=497(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 18
LDI r2, 497
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
