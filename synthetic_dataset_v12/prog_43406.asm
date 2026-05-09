; DESCRIPTION: Places a green line segment connecting (127, 187) to (498, 11).
; PLAN: r0=127(x1), r1=187(y1), r2=498(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 187
LDI r2, 498
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
