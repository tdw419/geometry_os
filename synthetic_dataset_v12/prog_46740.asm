; DESCRIPTION: Draws a green line from (99, 63) to (409, 126).
; PLAN: r0=99(x1), r1=63(y1), r2=409(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 63
LDI r2, 409
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
