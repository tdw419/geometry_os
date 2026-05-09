; DESCRIPTION: Draws a yellow line from (58, 151) to (14, 173).
; PLAN: r0=58(x1), r1=151(y1), r2=14(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 151
LDI r2, 14
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
