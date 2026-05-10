; DESCRIPTION: Draws a green line from (371, 144) to (170, 63).
; PLAN: r0=371(x1), r1=144(y1), r2=170(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 144
LDI r2, 170
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
