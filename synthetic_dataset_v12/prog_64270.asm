; DESCRIPTION: Places a cyan line segment connecting (310, 63) to (430, 91).
; PLAN: r0=310(x1), r1=63(y1), r2=430(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 63
LDI r2, 430
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
