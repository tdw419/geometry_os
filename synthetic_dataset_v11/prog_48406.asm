; DESCRIPTION: Draws a green line from (184, 56) to (45, 63).
; PLAN: r0=184(x1), r1=56(y1), r2=45(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 56
LDI r2, 45
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
