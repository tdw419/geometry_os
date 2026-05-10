; DESCRIPTION: Draws a yellow line from (294, 76) to (359, 36).
; PLAN: r0=294(x1), r1=76(y1), r2=359(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 76
LDI r2, 359
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
