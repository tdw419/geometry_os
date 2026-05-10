; DESCRIPTION: Draws a yellow line from (338, 104) to (217, 69).
; PLAN: r0=338(x1), r1=104(y1), r2=217(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 104
LDI r2, 217
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
