; DESCRIPTION: Places a green line segment connecting (458, 60) to (90, 223).
; PLAN: r0=458(x1), r1=60(y1), r2=90(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 60
LDI r2, 90
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
