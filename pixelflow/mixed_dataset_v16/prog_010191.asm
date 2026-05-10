; DESCRIPTION: Composite: Places a green dot at position (292, 62) then Draws a white circle centered at (432, 69) with radius 22.
; PLAN: r0=292(x), r1=62(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=69(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 292
LDI r1, 62
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 432
LDI r6, 69
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
