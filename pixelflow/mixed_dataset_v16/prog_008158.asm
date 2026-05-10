; DESCRIPTION: Draws a red line from (157, 27) to (373, 159).
; PLAN: r0=157(x1), r1=27(y1), r2=373(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 27
LDI r2, 373
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
