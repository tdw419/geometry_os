; DESCRIPTION: Creates a red circular shape at (448, 144) with radius 50.
; PLAN: r0=448(x), r1=144(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 144
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
