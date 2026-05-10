; DESCRIPTION: Draws a yellow line from (380, 124) to (92, 199).
; PLAN: r0=380(x1), r1=124(y1), r2=92(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 124
LDI r2, 92
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
