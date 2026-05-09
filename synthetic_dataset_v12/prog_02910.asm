; DESCRIPTION: Draws a magenta line from (415, 135) to (368, 88).
; PLAN: r0=415(x1), r1=135(y1), r2=368(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 135
LDI r2, 368
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
