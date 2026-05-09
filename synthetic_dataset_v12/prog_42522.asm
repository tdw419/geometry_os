; DESCRIPTION: Places a magenta line segment connecting (370, 82) to (405, 156).
; PLAN: r0=370(x1), r1=82(y1), r2=405(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 82
LDI r2, 405
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
