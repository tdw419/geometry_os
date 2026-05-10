; DESCRIPTION: Draws a yellow line from (54, 213) to (47, 192).
; PLAN: r0=54(x1), r1=213(y1), r2=47(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 213
LDI r2, 47
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
