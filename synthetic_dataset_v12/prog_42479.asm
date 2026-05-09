; DESCRIPTION: Draws a black line from (205, 154) to (349, 92).
; PLAN: r0=205(x1), r1=154(y1), r2=349(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 154
LDI r2, 349
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
