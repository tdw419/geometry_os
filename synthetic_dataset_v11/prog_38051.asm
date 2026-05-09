; DESCRIPTION: Draws a white line from (64, 191) to (203, 247).
; PLAN: r0=64(x1), r1=191(y1), r2=203(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 191
LDI r2, 203
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
