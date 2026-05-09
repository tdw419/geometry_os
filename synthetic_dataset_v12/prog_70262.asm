; DESCRIPTION: Places a green line segment connecting (458, 213) to (268, 90).
; PLAN: r0=458(x1), r1=213(y1), r2=268(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 213
LDI r2, 268
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
