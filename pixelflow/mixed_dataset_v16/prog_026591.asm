; DESCRIPTION: Draws a yellow line from (240, 107) to (30, 153).
; PLAN: r0=240(x1), r1=107(y1), r2=30(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 107
LDI r2, 30
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
