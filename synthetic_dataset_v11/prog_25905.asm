; DESCRIPTION: Draws a yellow line from (64, 137) to (174, 67).
; PLAN: r0=64(x1), r1=137(y1), r2=174(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 137
LDI r2, 174
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
