; DESCRIPTION: Draws a yellow line from (184, 192) to (433, 42).
; PLAN: r0=184(x1), r1=192(y1), r2=433(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 192
LDI r2, 433
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
