; DESCRIPTION: Draws a green line from (87, 62) to (15, 246).
; PLAN: r0=87(x1), r1=62(y1), r2=15(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 62
LDI r2, 15
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
