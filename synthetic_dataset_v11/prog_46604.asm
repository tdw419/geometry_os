; DESCRIPTION: Draws a cyan circle centered at (184, 102) with radius 50.
; PLAN: r0=184(x), r1=102(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 102
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
