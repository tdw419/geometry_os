; DESCRIPTION: Draws a yellow line from (280, 62) to (354, 11).
; PLAN: r0=280(x1), r1=62(y1), r2=354(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 62
LDI r2, 354
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
