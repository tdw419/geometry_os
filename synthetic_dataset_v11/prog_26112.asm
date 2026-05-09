; DESCRIPTION: Draws a yellow line from (87, 37) to (50, 255).
; PLAN: r0=87(x1), r1=37(y1), r2=50(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 37
LDI r2, 50
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
