; DESCRIPTION: Draws a red line from (14, 178) to (209, 154).
; PLAN: r0=14(x1), r1=178(y1), r2=209(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 178
LDI r2, 209
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
