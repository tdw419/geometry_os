; DESCRIPTION: Draws a white line from (92, 191) to (218, 229).
; PLAN: r0=92(x1), r1=191(y1), r2=218(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 191
LDI r2, 218
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
