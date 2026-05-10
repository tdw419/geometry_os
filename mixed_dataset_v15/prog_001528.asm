; DESCRIPTION: Draws a cyan circle centered at (199, 36) with radius 32.
; PLAN: r0=199(x), r1=36(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 36
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
