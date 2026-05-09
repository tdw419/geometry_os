; DESCRIPTION: Draws a white line from (482, 191) to (267, 79).
; PLAN: r0=482(x1), r1=191(y1), r2=267(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 191
LDI r2, 267
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
