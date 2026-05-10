; DESCRIPTION: Draws a green line from (58, 63) to (220, 224).
; PLAN: r0=58(x1), r1=63(y1), r2=220(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 63
LDI r2, 220
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
