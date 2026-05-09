; DESCRIPTION: Places a red circle of radius 63 at center (166, 96).
; PLAN: r0=166(x), r1=96(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 96
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
