; DESCRIPTION: Draws a white line from (316, 92) to (216, 228).
; PLAN: r0=316(x1), r1=92(y1), r2=216(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 92
LDI r2, 216
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
