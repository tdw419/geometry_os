; DESCRIPTION: Places a cyan line segment connecting (497, 132) to (264, 43).
; PLAN: r0=497(x1), r1=132(y1), r2=264(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 132
LDI r2, 264
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
