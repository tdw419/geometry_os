; DESCRIPTION: Draws a green line from (28, 87) to (120, 208).
; PLAN: r0=28(x1), r1=87(y1), r2=120(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 87
LDI r2, 120
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
