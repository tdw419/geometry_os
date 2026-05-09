; DESCRIPTION: Draws a yellow line from (63, 70) to (466, 134).
; PLAN: r0=63(x1), r1=70(y1), r2=466(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 70
LDI r2, 466
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
