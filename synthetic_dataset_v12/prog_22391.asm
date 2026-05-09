; DESCRIPTION: Draws a red line from (133, 87) to (505, 213).
; PLAN: r0=133(x1), r1=87(y1), r2=505(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 87
LDI r2, 505
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
