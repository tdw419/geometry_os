; DESCRIPTION: Draws a green line from (375, 65) to (93, 154).
; PLAN: r0=375(x1), r1=65(y1), r2=93(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 65
LDI r2, 93
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
