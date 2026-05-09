; DESCRIPTION: Draws a yellow line from (142, 141) to (9, 113).
; PLAN: r0=142(x1), r1=141(y1), r2=9(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 141
LDI r2, 9
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
