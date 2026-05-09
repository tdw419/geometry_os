; DESCRIPTION: Draws a green line from (217, 129) to (376, 123).
; PLAN: r0=217(x1), r1=129(y1), r2=376(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 129
LDI r2, 376
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
