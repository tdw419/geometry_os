; DESCRIPTION: Draws a yellow line from (315, 34) to (173, 192).
; PLAN: r0=315(x1), r1=34(y1), r2=173(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 34
LDI r2, 173
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
