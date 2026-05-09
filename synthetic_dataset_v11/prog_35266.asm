; DESCRIPTION: Draws a yellow line from (64, 40) to (103, 187).
; PLAN: r0=64(x1), r1=40(y1), r2=103(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 40
LDI r2, 103
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
