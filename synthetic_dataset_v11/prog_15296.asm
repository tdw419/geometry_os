; DESCRIPTION: Draws a green line from (111, 187) to (131, 11).
; PLAN: r0=111(x1), r1=187(y1), r2=131(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 187
LDI r2, 131
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
