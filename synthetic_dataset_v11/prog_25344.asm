; DESCRIPTION: Draws a yellow line from (74, 193) to (91, 231).
; PLAN: r0=74(x1), r1=193(y1), r2=91(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 193
LDI r2, 91
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
