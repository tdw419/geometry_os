; DESCRIPTION: Places a white line segment connecting (481, 3) to (265, 108).
; PLAN: r0=481(x1), r1=3(y1), r2=265(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 3
LDI r2, 265
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
