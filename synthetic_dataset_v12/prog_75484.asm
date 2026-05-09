; DESCRIPTION: Draws a green line from (83, 137) to (360, 154).
; PLAN: r0=83(x1), r1=137(y1), r2=360(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 137
LDI r2, 360
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
