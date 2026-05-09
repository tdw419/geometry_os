; DESCRIPTION: Draws a green line from (64, 192) to (264, 255).
; PLAN: r0=64(x1), r1=192(y1), r2=264(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 192
LDI r2, 264
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
