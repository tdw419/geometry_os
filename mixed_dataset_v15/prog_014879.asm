; DESCRIPTION: Draws a yellow line from (202, 72) to (50, 140).
; PLAN: r0=202(x1), r1=72(y1), r2=50(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 72
LDI r2, 50
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
