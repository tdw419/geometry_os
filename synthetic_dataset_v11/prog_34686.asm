; DESCRIPTION: Draws a red line from (74, 111) to (25, 126).
; PLAN: r0=74(x1), r1=111(y1), r2=25(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 111
LDI r2, 25
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
