; DESCRIPTION: Draws a yellow line from (244, 50) to (184, 32).
; PLAN: r0=244(x1), r1=50(y1), r2=184(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 50
LDI r2, 184
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
