; DESCRIPTION: Draws a green line from (166, 86) to (345, 60).
; PLAN: r0=166(x1), r1=86(y1), r2=345(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 86
LDI r2, 345
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
