; DESCRIPTION: Draws a red line from (456, 134) to (340, 141).
; PLAN: r0=456(x1), r1=134(y1), r2=340(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 134
LDI r2, 340
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
