; DESCRIPTION: Draws a cyan circle centered at (408, 165) with radius 67.
; PLAN: r0=408(x), r1=165(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 165
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
