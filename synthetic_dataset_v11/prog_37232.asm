; DESCRIPTION: Draws a black line from (92, 28) to (225, 82).
; PLAN: r0=92(x1), r1=28(y1), r2=225(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 28
LDI r2, 225
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
