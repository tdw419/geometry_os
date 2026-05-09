; DESCRIPTION: Draws a blue line from (382, 32) to (98, 23).
; PLAN: r0=382(x1), r1=32(y1), r2=98(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 32
LDI r2, 98
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
