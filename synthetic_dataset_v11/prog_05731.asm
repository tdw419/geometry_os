; DESCRIPTION: Draws a yellow line from (94, 154) to (87, 176).
; PLAN: r0=94(x1), r1=154(y1), r2=87(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 154
LDI r2, 87
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
