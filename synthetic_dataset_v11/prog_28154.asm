; DESCRIPTION: Draws a black line from (166, 63) to (193, 32).
; PLAN: r0=166(x1), r1=63(y1), r2=193(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 63
LDI r2, 193
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
