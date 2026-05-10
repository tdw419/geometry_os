; DESCRIPTION: Draws a cyan circle centered at (167, 150) with radius 65.
; PLAN: r0=167(x), r1=150(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 150
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
