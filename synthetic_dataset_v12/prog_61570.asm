; DESCRIPTION: Places a black line segment connecting (365, 167) to (410, 203).
; PLAN: r0=365(x1), r1=167(y1), r2=410(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 167
LDI r2, 410
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
