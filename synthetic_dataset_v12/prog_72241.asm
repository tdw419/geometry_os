; DESCRIPTION: Draws a cyan circle centered at (393, 95) with radius 59.
; PLAN: r0=393(x), r1=95(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 95
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
