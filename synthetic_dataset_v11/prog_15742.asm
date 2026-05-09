; DESCRIPTION: Draws a yellow line from (27, 161) to (150, 192).
; PLAN: r0=27(x1), r1=161(y1), r2=150(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 161
LDI r2, 150
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
