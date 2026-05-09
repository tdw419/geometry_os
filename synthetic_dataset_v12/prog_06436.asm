; DESCRIPTION: Renders a green line between points (445, 101) and (56, 165).
; PLAN: r0=445(x1), r1=101(y1), r2=56(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 101
LDI r2, 56
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
