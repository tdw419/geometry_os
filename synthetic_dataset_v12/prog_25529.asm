; DESCRIPTION: Places a magenta line segment connecting (458, 6) to (98, 166).
; PLAN: r0=458(x1), r1=6(y1), r2=98(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 6
LDI r2, 98
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
