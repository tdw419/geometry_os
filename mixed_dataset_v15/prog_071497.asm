; DESCRIPTION: Composite: Creates a black circular shape at (421, 191) with radius 63 then Renders a white box of size 102x90 starting at (305, 129) then Sets a single red pixel at (453, 139).
; PLAN: r0=421(x), r1=191(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=129(y), r7=102(width), r8=90(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x), r11=139(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 191
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 129
LDI r7, 102
LDI r8, 90
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 139
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
