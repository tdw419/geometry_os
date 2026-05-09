; DESCRIPTION: Draws a white line from (363, 95) to (214, 92).
; PLAN: r0=363(x1), r1=95(y1), r2=214(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 95
LDI r2, 214
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
