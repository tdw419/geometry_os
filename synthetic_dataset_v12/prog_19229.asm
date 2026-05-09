; DESCRIPTION: Draws a yellow line from (153, 239) to (195, 218).
; PLAN: r0=153(x1), r1=239(y1), r2=195(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 239
LDI r2, 195
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
