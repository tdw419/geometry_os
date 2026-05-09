; DESCRIPTION: Draws a red line from (90, 70) to (107, 91).
; PLAN: r0=90(x1), r1=70(y1), r2=107(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 70
LDI r2, 107
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
