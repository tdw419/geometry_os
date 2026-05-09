; DESCRIPTION: Draws a black line from (151, 205) to (92, 60).
; PLAN: r0=151(x1), r1=205(y1), r2=92(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 205
LDI r2, 92
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
