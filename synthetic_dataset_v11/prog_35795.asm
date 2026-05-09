; DESCRIPTION: Draws a green line from (192, 65) to (107, 167).
; PLAN: r0=192(x1), r1=65(y1), r2=107(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 65
LDI r2, 107
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
