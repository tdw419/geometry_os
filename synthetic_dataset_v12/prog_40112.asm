; DESCRIPTION: Draws a green line from (85, 192) to (356, 167).
; PLAN: r0=85(x1), r1=192(y1), r2=356(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 192
LDI r2, 356
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
