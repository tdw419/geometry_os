; DESCRIPTION: Draws a green line from (8, 245) to (158, 172).
; PLAN: r0=8(x1), r1=245(y1), r2=158(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 245
LDI r2, 158
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
