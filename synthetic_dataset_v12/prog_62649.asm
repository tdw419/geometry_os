; DESCRIPTION: Draws a green line from (111, 132) to (442, 75).
; PLAN: r0=111(x1), r1=132(y1), r2=442(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 132
LDI r2, 442
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
