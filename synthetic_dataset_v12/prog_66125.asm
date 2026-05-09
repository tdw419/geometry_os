; DESCRIPTION: Draws a yellow line from (113, 164) to (130, 207).
; PLAN: r0=113(x1), r1=164(y1), r2=130(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 164
LDI r2, 130
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
