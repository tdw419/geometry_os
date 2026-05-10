; DESCRIPTION: Draws a orange line from (213, 187) to (21, 190).
; PLAN: r0=213(x1), r1=187(y1), r2=21(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 187
LDI r2, 21
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
