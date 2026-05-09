; DESCRIPTION: Draws a green line from (498, 26) to (492, 98).
; PLAN: r0=498(x1), r1=26(y1), r2=492(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 26
LDI r2, 492
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
