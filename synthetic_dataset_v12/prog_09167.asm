; DESCRIPTION: Places a green line segment connecting (265, 213) to (367, 97).
; PLAN: r0=265(x1), r1=213(y1), r2=367(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 213
LDI r2, 367
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
