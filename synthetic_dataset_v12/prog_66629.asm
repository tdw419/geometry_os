; DESCRIPTION: Draws a yellow line from (222, 7) to (354, 16).
; PLAN: r0=222(x1), r1=7(y1), r2=354(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 7
LDI r2, 354
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
