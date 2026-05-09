; DESCRIPTION: Draws a yellow line from (191, 210) to (184, 207).
; PLAN: r0=191(x1), r1=210(y1), r2=184(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 210
LDI r2, 184
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
