; DESCRIPTION: Draws a green line from (207, 111) to (13, 191).
; PLAN: r0=207(x1), r1=111(y1), r2=13(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 111
LDI r2, 13
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
