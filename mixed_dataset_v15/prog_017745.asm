; DESCRIPTION: Draws a yellow line from (243, 23) to (202, 252).
; PLAN: r0=243(x1), r1=23(y1), r2=202(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 23
LDI r2, 202
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
