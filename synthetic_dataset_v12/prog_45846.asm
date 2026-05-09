; DESCRIPTION: Draws a white circle centered at (413, 208) with radius 16.
; PLAN: r0=413(x), r1=208(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 208
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
