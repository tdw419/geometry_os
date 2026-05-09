; DESCRIPTION: Places a green line segment connecting (69, 183) to (301, 71).
; PLAN: r0=69(x1), r1=183(y1), r2=301(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 183
LDI r2, 301
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
