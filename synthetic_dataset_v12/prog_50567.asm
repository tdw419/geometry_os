; DESCRIPTION: Draws a red line from (366, 60) to (444, 213).
; PLAN: r0=366(x1), r1=60(y1), r2=444(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 60
LDI r2, 444
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
