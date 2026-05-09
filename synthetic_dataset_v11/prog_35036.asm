; DESCRIPTION: Draws a red line from (43, 166) to (195, 117).
; PLAN: r0=43(x1), r1=166(y1), r2=195(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 166
LDI r2, 195
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
