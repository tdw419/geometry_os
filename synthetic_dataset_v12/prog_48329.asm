; DESCRIPTION: Draws a red line from (37, 154) to (254, 17).
; PLAN: r0=37(x1), r1=154(y1), r2=254(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 154
LDI r2, 254
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
