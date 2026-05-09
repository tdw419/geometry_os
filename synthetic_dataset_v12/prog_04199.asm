; DESCRIPTION: Creates a red circular shape at (220, 128) with radius 80.
; PLAN: r0=220(x), r1=128(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 128
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
