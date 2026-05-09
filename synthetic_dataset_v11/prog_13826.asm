; DESCRIPTION: Draws a yellow line from (68, 161) to (242, 85).
; PLAN: r0=68(x1), r1=161(y1), r2=242(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 161
LDI r2, 242
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
