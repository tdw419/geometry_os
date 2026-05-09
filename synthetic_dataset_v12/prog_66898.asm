; DESCRIPTION: Draws a green line from (272, 132) to (66, 102).
; PLAN: r0=272(x1), r1=132(y1), r2=66(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 132
LDI r2, 66
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
