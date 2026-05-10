; DESCRIPTION: Places a magenta line segment connecting (445, 206) to (483, 12).
; PLAN: r0=445(x1), r1=206(y1), r2=483(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 206
LDI r2, 483
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
