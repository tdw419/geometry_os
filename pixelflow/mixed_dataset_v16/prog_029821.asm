; DESCRIPTION: Draws a yellow line from (151, 222) to (272, 117).
; PLAN: r0=151(x1), r1=222(y1), r2=272(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 222
LDI r2, 272
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
