; DESCRIPTION: Draws a yellow line from (45, 107) to (16, 144).
; PLAN: r0=45(x1), r1=107(y1), r2=16(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 107
LDI r2, 16
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
