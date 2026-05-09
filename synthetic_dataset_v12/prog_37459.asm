; DESCRIPTION: Renders a green line between points (332, 32) and (30, 247).
; PLAN: r0=332(x1), r1=32(y1), r2=30(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 32
LDI r2, 30
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
