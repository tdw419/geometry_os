; DESCRIPTION: Draws a yellow line from (49, 160) to (34, 213).
; PLAN: r0=49(x1), r1=160(y1), r2=34(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 160
LDI r2, 34
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
