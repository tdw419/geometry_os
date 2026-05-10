; DESCRIPTION: Draws a cyan circle centered at (418, 95) with radius 21.
; PLAN: r0=418(x), r1=95(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 95
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
