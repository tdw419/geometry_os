; DESCRIPTION: Draws a green line from (272, 178) to (70, 56).
; PLAN: r0=272(x1), r1=178(y1), r2=70(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 178
LDI r2, 70
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
