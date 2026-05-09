; DESCRIPTION: Draws a yellow line from (126, 161) to (137, 255).
; PLAN: r0=126(x1), r1=161(y1), r2=137(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 161
LDI r2, 137
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
