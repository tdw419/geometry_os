; DESCRIPTION: Draws a green line from (158, 150) to (59, 214).
; PLAN: r0=158(x1), r1=150(y1), r2=59(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 150
LDI r2, 59
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
