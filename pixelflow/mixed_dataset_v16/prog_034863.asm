; DESCRIPTION: Draws a yellow line from (283, 131) to (329, 38).
; PLAN: r0=283(x1), r1=131(y1), r2=329(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 131
LDI r2, 329
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
