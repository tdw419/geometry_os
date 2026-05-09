; DESCRIPTION: Draws a yellow line from (63, 216) to (210, 239).
; PLAN: r0=63(x1), r1=216(y1), r2=210(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 216
LDI r2, 210
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
