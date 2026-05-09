; DESCRIPTION: Draws a yellow line from (368, 21) to (399, 24).
; PLAN: r0=368(x1), r1=21(y1), r2=399(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 21
LDI r2, 399
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
