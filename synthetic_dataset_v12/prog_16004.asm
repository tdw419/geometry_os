; DESCRIPTION: Draws a yellow line from (138, 36) to (252, 242).
; PLAN: r0=138(x1), r1=36(y1), r2=252(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 36
LDI r2, 252
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
