; DESCRIPTION: Draws a green line from (98, 83) to (370, 252).
; PLAN: r0=98(x1), r1=83(y1), r2=370(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 83
LDI r2, 370
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
