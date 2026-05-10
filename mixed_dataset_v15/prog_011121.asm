; DESCRIPTION: Draws a yellow line from (14, 173) to (300, 25).
; PLAN: r0=14(x1), r1=173(y1), r2=300(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 173
LDI r2, 300
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
