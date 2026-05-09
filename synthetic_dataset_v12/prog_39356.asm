; DESCRIPTION: Draws a yellow line from (425, 39) to (258, 109).
; PLAN: r0=425(x1), r1=39(y1), r2=258(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 39
LDI r2, 258
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
