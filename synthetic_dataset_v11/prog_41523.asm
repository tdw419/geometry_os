; DESCRIPTION: Draws a red line from (247, 67) to (217, 104).
; PLAN: r0=247(x1), r1=67(y1), r2=217(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 67
LDI r2, 217
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
