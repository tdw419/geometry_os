; DESCRIPTION: Places a yellow 63x98 box at position (262, 39).
; PLAN: r0=262(x), r1=39(y), r2=63(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 39
LDI r2, 63
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
