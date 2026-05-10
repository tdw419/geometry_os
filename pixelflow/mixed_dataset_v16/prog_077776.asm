; DESCRIPTION: Draws a yellow line from (103, 153) to (269, 173).
; PLAN: r0=103(x1), r1=153(y1), r2=269(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 153
LDI r2, 269
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
