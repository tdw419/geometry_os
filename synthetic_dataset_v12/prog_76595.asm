; DESCRIPTION: Draws a yellow line from (39, 108) to (447, 192).
; PLAN: r0=39(x1), r1=108(y1), r2=447(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 108
LDI r2, 447
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
