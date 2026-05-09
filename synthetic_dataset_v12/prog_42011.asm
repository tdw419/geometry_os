; DESCRIPTION: Renders a green line between points (378, 64) and (154, 63).
; PLAN: r0=378(x1), r1=64(y1), r2=154(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 64
LDI r2, 154
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
