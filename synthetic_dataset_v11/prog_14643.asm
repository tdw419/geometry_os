; DESCRIPTION: Draws a yellow line from (166, 238) to (191, 202).
; PLAN: r0=166(x1), r1=238(y1), r2=191(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 238
LDI r2, 191
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
