; DESCRIPTION: Composite: Sets a single cyan pixel at (130, 85) then Draws a white circle centered at (398, 150) with radius 15.
; PLAN: r0=130(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=150(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 130
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 398
LDI r6, 150
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
