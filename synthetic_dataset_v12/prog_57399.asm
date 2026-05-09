; DESCRIPTION: Draws a yellow line from (470, 27) to (310, 204).
; PLAN: r0=470(x1), r1=27(y1), r2=310(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 27
LDI r2, 310
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
