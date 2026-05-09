; DESCRIPTION: Draws a yellow line from (360, 176) to (449, 36).
; PLAN: r0=360(x1), r1=176(y1), r2=449(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 176
LDI r2, 449
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
