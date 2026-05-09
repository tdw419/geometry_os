; DESCRIPTION: Draws a red line from (99, 113) to (247, 213).
; PLAN: r0=99(x1), r1=113(y1), r2=247(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 113
LDI r2, 247
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
