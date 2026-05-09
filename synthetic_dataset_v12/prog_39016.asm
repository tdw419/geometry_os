; DESCRIPTION: Draws a cyan circle centered at (338, 73) with radius 59.
; PLAN: r0=338(x), r1=73(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 73
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
