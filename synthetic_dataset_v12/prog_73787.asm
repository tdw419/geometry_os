; DESCRIPTION: Draws a green line from (24, 205) to (381, 154).
; PLAN: r0=24(x1), r1=205(y1), r2=381(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 205
LDI r2, 381
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
