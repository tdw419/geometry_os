; DESCRIPTION: Draws a red line from (217, 65) to (213, 74).
; PLAN: r0=217(x1), r1=65(y1), r2=213(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 65
LDI r2, 213
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
