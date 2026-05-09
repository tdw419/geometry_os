; DESCRIPTION: Places a cyan line segment connecting (429, 23) to (466, 36).
; PLAN: r0=429(x1), r1=23(y1), r2=466(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 23
LDI r2, 466
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
