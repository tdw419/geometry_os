; DESCRIPTION: Draws a red line from (17, 3) to (460, 143).
; PLAN: r0=17(x1), r1=3(y1), r2=460(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 3
LDI r2, 460
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
