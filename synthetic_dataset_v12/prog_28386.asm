; DESCRIPTION: Draws a green line from (300, 24) to (195, 117).
; PLAN: r0=300(x1), r1=24(y1), r2=195(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 24
LDI r2, 195
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
