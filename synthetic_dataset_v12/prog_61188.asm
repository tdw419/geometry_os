; DESCRIPTION: Draws a red line from (189, 154) to (111, 162).
; PLAN: r0=189(x1), r1=154(y1), r2=111(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 154
LDI r2, 111
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
