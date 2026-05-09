; DESCRIPTION: Draws a yellow line from (212, 239) to (202, 251).
; PLAN: r0=212(x1), r1=239(y1), r2=202(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 239
LDI r2, 202
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
