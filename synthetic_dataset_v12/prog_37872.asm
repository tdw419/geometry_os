; DESCRIPTION: Draws a yellow line from (69, 154) to (470, 15).
; PLAN: r0=69(x1), r1=154(y1), r2=470(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 154
LDI r2, 470
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
