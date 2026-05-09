; DESCRIPTION: Draws a black line from (140, 54) to (306, 154).
; PLAN: r0=140(x1), r1=54(y1), r2=306(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 54
LDI r2, 306
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
