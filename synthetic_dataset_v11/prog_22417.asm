; DESCRIPTION: Draws a yellow line from (189, 179) to (144, 192).
; PLAN: r0=189(x1), r1=179(y1), r2=144(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 179
LDI r2, 144
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
