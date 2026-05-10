; DESCRIPTION: Draws a yellow line from (60, 134) to (417, 71).
; PLAN: r0=60(x1), r1=134(y1), r2=417(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 134
LDI r2, 417
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
