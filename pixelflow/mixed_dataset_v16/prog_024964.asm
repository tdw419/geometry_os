; DESCRIPTION: Draws a yellow line from (16, 55) to (29, 231).
; PLAN: r0=16(x1), r1=55(y1), r2=29(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 55
LDI r2, 29
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
