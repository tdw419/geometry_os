; DESCRIPTION: Draws a white line from (79, 191) to (126, 208).
; PLAN: r0=79(x1), r1=191(y1), r2=126(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 191
LDI r2, 126
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
