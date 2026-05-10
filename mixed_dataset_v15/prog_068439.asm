; DESCRIPTION: Draws a yellow line from (231, 27) to (249, 116).
; PLAN: r0=231(x1), r1=27(y1), r2=249(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 27
LDI r2, 249
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
