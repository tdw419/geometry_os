; DESCRIPTION: Renders a magenta line between points (452, 102) and (469, 59).
; PLAN: r0=452(x1), r1=102(y1), r2=469(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 102
LDI r2, 469
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
