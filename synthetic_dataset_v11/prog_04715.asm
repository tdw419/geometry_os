; DESCRIPTION: Draws a red line from (239, 66) to (23, 222).
; PLAN: r0=239(x1), r1=66(y1), r2=23(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 66
LDI r2, 23
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
