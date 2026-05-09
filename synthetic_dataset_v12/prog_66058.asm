; DESCRIPTION: Draws a blue line from (42, 137) to (184, 236).
; PLAN: r0=42(x1), r1=137(y1), r2=184(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 137
LDI r2, 184
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
