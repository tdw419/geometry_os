; DESCRIPTION: Draws a green line from (37, 28) to (252, 166).
; PLAN: r0=37(x1), r1=28(y1), r2=252(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 28
LDI r2, 252
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
