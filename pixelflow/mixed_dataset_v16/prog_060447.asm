; DESCRIPTION: Draws a green line from (157, 19) to (269, 86).
; PLAN: r0=157(x1), r1=19(y1), r2=269(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 19
LDI r2, 269
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
