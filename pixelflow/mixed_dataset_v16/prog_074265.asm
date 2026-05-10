; DESCRIPTION: Draws a green line from (175, 140) to (358, 63).
; PLAN: r0=175(x1), r1=140(y1), r2=358(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 140
LDI r2, 358
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
