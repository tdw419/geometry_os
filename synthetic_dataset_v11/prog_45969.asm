; DESCRIPTION: Draws a yellow line from (168, 79) to (132, 208).
; PLAN: r0=168(x1), r1=79(y1), r2=132(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 79
LDI r2, 132
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
