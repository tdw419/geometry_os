; DESCRIPTION: Draws a red line from (148, 205) to (150, 70).
; PLAN: r0=148(x1), r1=205(y1), r2=150(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 205
LDI r2, 150
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
