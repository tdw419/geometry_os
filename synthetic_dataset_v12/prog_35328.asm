; DESCRIPTION: Draws a cyan circle centered at (413, 111) with radius 16.
; PLAN: r0=413(x), r1=111(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 111
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
