; DESCRIPTION: Draws a red line from (279, 71) to (434, 2).
; PLAN: r0=279(x1), r1=71(y1), r2=434(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 71
LDI r2, 434
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
