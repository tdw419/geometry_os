; DESCRIPTION: Draws a blue line from (465, 173) to (486, 182).
; PLAN: r0=465(x1), r1=173(y1), r2=486(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 173
LDI r2, 486
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
