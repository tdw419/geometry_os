; DESCRIPTION: Draws a red line from (107, 98) to (205, 234).
; PLAN: r0=107(x1), r1=98(y1), r2=205(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 98
LDI r2, 205
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
