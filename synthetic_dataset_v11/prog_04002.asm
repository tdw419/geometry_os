; DESCRIPTION: Places a cyan line segment connecting (230, 199) to (203, 98).
; PLAN: r0=230(x1), r1=199(y1), r2=203(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 199
LDI r2, 203
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
