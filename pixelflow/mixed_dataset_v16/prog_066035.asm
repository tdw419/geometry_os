; DESCRIPTION: Places a green disk with center (158, 145) and radius 42.
; PLAN: r0=158(x), r1=145(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 145
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
