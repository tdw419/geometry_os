; DESCRIPTION: Renders a green line between points (31, 245) and (74, 36).
; PLAN: r0=31(x1), r1=245(y1), r2=74(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 245
LDI r2, 74
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
