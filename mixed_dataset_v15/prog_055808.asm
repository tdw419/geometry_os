; DESCRIPTION: Places a white line segment connecting (9, 66) to (231, 166).
; PLAN: r0=9(x1), r1=66(y1), r2=231(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 66
LDI r2, 231
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
