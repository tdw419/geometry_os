; DESCRIPTION: Draws a green line from (252, 245) to (14, 33).
; PLAN: r0=252(x1), r1=245(y1), r2=14(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 245
LDI r2, 14
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
