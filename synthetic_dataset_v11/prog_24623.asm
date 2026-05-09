; DESCRIPTION: Draws a yellow line from (91, 206) to (160, 95).
; PLAN: r0=91(x1), r1=206(y1), r2=160(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 206
LDI r2, 160
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
