; DESCRIPTION: Draws a yellow line from (382, 144) to (101, 242).
; PLAN: r0=382(x1), r1=144(y1), r2=101(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 144
LDI r2, 101
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
