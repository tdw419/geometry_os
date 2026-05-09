; DESCRIPTION: Draws a yellow line from (406, 3) to (103, 71).
; PLAN: r0=406(x1), r1=3(y1), r2=103(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 3
LDI r2, 103
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
