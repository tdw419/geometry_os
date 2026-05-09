; DESCRIPTION: Draws a green line from (31, 48) to (205, 48).
; PLAN: r0=31(x1), r1=48(y1), r2=205(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 48
LDI r2, 205
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
