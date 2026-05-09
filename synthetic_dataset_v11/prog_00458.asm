; DESCRIPTION: Draws a blue line from (116, 205) to (182, 166).
; PLAN: r0=116(x1), r1=205(y1), r2=182(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 205
LDI r2, 182
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
