; DESCRIPTION: Places a cyan line segment connecting (159, 5) to (342, 56).
; PLAN: r0=159(x1), r1=5(y1), r2=342(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 5
LDI r2, 342
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
