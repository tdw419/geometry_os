; DESCRIPTION: Draws a blue line from (468, 226) to (272, 125).
; PLAN: r0=468(x1), r1=226(y1), r2=272(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 226
LDI r2, 272
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
