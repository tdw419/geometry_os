; DESCRIPTION: Draws a red line from (126, 12) to (37, 161).
; PLAN: r0=126(x1), r1=12(y1), r2=37(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 12
LDI r2, 37
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
