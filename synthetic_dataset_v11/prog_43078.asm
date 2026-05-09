; DESCRIPTION: Draws a green line from (168, 123) to (132, 86).
; PLAN: r0=168(x1), r1=123(y1), r2=132(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 123
LDI r2, 132
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
