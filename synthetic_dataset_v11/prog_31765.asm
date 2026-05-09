; DESCRIPTION: Draws a red line from (162, 22) to (66, 228).
; PLAN: r0=162(x1), r1=22(y1), r2=66(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 22
LDI r2, 66
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
