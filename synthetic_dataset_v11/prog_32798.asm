; DESCRIPTION: Draws a yellow line from (116, 120) to (167, 152).
; PLAN: r0=116(x1), r1=120(y1), r2=167(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 120
LDI r2, 167
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
