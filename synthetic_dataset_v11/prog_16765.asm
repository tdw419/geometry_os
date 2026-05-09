; DESCRIPTION: Draws a yellow line from (154, 249) to (72, 23).
; PLAN: r0=154(x1), r1=249(y1), r2=72(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 249
LDI r2, 72
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
