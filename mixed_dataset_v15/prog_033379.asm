; DESCRIPTION: Draws a green line from (464, 224) to (269, 255).
; PLAN: r0=464(x1), r1=224(y1), r2=269(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 224
LDI r2, 269
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
