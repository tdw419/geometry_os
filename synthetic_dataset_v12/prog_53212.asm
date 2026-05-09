; DESCRIPTION: Draws a green line from (97, 167) to (356, 39).
; PLAN: r0=97(x1), r1=167(y1), r2=356(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 167
LDI r2, 356
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
