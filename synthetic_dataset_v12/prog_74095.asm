; DESCRIPTION: Draws a yellow line from (239, 176) to (420, 102).
; PLAN: r0=239(x1), r1=176(y1), r2=420(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 176
LDI r2, 420
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
