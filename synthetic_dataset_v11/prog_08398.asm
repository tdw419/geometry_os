; DESCRIPTION: Draws a cyan circle centered at (154, 167) with radius 72.
; PLAN: r0=154(x), r1=167(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 167
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
