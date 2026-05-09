; DESCRIPTION: Composite: Sets a single cyan pixel at (328, 5) then Draws a blue circle centered at (100, 129) with radius 80.
; PLAN: r0=328(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=129(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 129
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
