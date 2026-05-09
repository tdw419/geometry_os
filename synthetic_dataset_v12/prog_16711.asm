; DESCRIPTION: Composite: Creates a green circular shape at (453, 163) with radius 33 then Renders a cyan box of size 17x76 starting at (200, 30) then Places a purple dot at position (213, 11).
; PLAN: r0=453(x), r1=163(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x), r6=30(y), r7=17(width), r8=76(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=11(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 453
LDI r1, 163
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 30
LDI r7, 17
LDI r8, 76
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 11
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
