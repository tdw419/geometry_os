; DESCRIPTION: Draws a orange line from (217, 191) to (207, 113).
; PLAN: r0=217(x1), r1=191(y1), r2=207(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 191
LDI r2, 207
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
