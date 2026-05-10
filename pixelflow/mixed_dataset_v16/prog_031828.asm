; DESCRIPTION: Draws a yellow line from (172, 208) to (445, 251).
; PLAN: r0=172(x1), r1=208(y1), r2=445(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 208
LDI r2, 445
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
