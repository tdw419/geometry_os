; DESCRIPTION: Draws a yellow line from (148, 81) to (284, 8).
; PLAN: r0=148(x1), r1=81(y1), r2=284(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 81
LDI r2, 284
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
