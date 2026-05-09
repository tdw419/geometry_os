; DESCRIPTION: Draws a red line from (116, 12) to (386, 183).
; PLAN: r0=116(x1), r1=12(y1), r2=386(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 12
LDI r2, 386
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
