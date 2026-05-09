; DESCRIPTION: Draws a green line from (177, 197) to (192, 144).
; PLAN: r0=177(x1), r1=197(y1), r2=192(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 197
LDI r2, 192
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
