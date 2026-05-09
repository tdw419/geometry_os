; DESCRIPTION: Places a yellow line segment connecting (195, 213) to (129, 236).
; PLAN: r0=195(x1), r1=213(y1), r2=129(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 213
LDI r2, 129
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
