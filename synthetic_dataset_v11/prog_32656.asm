; DESCRIPTION: Draws a yellow line from (123, 9) to (16, 166).
; PLAN: r0=123(x1), r1=9(y1), r2=16(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 9
LDI r2, 16
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
