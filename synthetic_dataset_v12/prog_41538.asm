; DESCRIPTION: Draws a yellow line from (64, 178) to (395, 223).
; PLAN: r0=64(x1), r1=178(y1), r2=395(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 178
LDI r2, 395
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
