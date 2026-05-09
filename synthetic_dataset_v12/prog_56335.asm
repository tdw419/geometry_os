; DESCRIPTION: Draws a cyan circle centered at (48, 38) with radius 28.
; PLAN: r0=48(x), r1=38(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 38
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
