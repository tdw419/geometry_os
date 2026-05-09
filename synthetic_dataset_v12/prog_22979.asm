; DESCRIPTION: Draws a yellow line from (225, 48) to (285, 56).
; PLAN: r0=225(x1), r1=48(y1), r2=285(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 48
LDI r2, 285
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
