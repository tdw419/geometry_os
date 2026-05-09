; DESCRIPTION: Draws a yellow line from (230, 33) to (178, 36).
; PLAN: r0=230(x1), r1=33(y1), r2=178(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 33
LDI r2, 178
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
