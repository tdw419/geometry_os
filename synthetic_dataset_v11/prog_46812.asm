; DESCRIPTION: Draws a yellow line from (123, 33) to (170, 126).
; PLAN: r0=123(x1), r1=33(y1), r2=170(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 33
LDI r2, 170
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
