; DESCRIPTION: Draws a yellow line from (459, 0) to (406, 231).
; PLAN: r0=459(x1), r1=0(y1), r2=406(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 0
LDI r2, 406
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
