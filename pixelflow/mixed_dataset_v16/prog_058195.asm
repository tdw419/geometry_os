; DESCRIPTION: Draws a green line from (380, 7) to (92, 56).
; PLAN: r0=380(x1), r1=7(y1), r2=92(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 7
LDI r2, 92
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
