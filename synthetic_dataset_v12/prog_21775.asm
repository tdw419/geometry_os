; DESCRIPTION: Draws a green line from (345, 134) to (475, 37).
; PLAN: r0=345(x1), r1=134(y1), r2=475(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 134
LDI r2, 475
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
