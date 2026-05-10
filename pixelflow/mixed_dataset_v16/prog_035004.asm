; DESCRIPTION: Draws a orange line from (50, 126) to (192, 154).
; PLAN: r0=50(x1), r1=126(y1), r2=192(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 126
LDI r2, 192
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
