; DESCRIPTION: Draws a red line from (256, 134) to (36, 117).
; PLAN: r0=256(x1), r1=134(y1), r2=36(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 134
LDI r2, 36
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
