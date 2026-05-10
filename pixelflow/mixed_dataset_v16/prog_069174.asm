; DESCRIPTION: Places a magenta line segment connecting (425, 111) to (452, 52).
; PLAN: r0=425(x1), r1=111(y1), r2=452(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 111
LDI r2, 452
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
