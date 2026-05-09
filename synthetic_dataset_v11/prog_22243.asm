; DESCRIPTION: Draws a yellow line from (230, 48) to (78, 12).
; PLAN: r0=230(x1), r1=48(y1), r2=78(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 48
LDI r2, 78
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
