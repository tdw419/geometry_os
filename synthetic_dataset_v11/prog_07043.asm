; DESCRIPTION: Draws a red line from (165, 237) to (181, 28).
; PLAN: r0=165(x1), r1=237(y1), r2=181(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 237
LDI r2, 181
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
