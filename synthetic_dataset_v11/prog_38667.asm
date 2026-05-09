; DESCRIPTION: Draws a yellow line from (166, 65) to (230, 154).
; PLAN: r0=166(x1), r1=65(y1), r2=230(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 65
LDI r2, 230
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
