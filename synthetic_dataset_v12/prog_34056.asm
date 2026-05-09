; DESCRIPTION: Places a black line segment connecting (410, 16) to (265, 87).
; PLAN: r0=410(x1), r1=16(y1), r2=265(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 16
LDI r2, 265
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
