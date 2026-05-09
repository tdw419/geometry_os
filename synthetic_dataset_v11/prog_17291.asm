; DESCRIPTION: Draws a blue line from (242, 192) to (197, 144).
; PLAN: r0=242(x1), r1=192(y1), r2=197(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 192
LDI r2, 197
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
