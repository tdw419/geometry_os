; DESCRIPTION: Composite: Renders a cyan box of size 77x91 starting at (325, 145) then Draws a green circle centered at (54, 54) with radius 51.
; PLAN: r0=325(x), r1=145(y), r2=77(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x), r6=54(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 325
LDI r1, 145
LDI r2, 77
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 54
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
