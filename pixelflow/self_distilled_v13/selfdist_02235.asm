; DESCRIPTION: Draws a red line from (81, 24) to (386, 68).
; PLAN: r0=81(x1), r1=24(y1), r2=386(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 24
LDI r2, 386
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
