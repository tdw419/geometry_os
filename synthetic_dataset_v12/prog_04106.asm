; DESCRIPTION: Draws a green line from (181, 76) to (166, 32).
; PLAN: r0=181(x1), r1=76(y1), r2=166(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 76
LDI r2, 166
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
