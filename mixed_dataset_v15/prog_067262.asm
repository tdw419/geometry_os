; DESCRIPTION: Draws a green line from (417, 194) to (371, 170).
; PLAN: r0=417(x1), r1=194(y1), r2=371(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 194
LDI r2, 371
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
