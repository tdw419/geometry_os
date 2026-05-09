; DESCRIPTION: Draws a yellow line from (64, 124) to (212, 231).
; PLAN: r0=64(x1), r1=124(y1), r2=212(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 124
LDI r2, 212
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
