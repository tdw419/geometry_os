; DESCRIPTION: Creates a magenta circular shape at (290, 144) with radius 55.
; PLAN: r0=290(x), r1=144(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 144
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
