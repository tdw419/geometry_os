; DESCRIPTION: Places a yellow 65x59 box at position (75, 35).
; PLAN: r0=75(x), r1=35(y), r2=65(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 35
LDI r2, 65
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
