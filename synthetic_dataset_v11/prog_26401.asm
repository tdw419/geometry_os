; DESCRIPTION: Draws a yellow line from (126, 192) to (105, 55).
; PLAN: r0=126(x1), r1=192(y1), r2=105(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 192
LDI r2, 105
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
