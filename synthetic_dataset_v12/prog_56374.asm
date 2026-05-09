; DESCRIPTION: Places a cyan line segment connecting (324, 187) to (249, 137).
; PLAN: r0=324(x1), r1=187(y1), r2=249(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 187
LDI r2, 249
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
