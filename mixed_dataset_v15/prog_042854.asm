; DESCRIPTION: Draws a purple line from (174, 96) to (203, 154).
; PLAN: r0=174(x1), r1=96(y1), r2=203(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 96
LDI r2, 203
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
