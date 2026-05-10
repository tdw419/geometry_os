; DESCRIPTION: Composite: Sets a single black pixel at (386, 148) then Renders a cyan box of size 16x56 starting at (293, 12) then Renders a black disk with center (275, 106) and radius 79.
; PLAN: r0=386(x), r1=148(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=12(y), r7=16(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=275(x), r11=106(y), r12=79(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 386
LDI r1, 148
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 293
LDI r6, 12
LDI r7, 16
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 106
LDI r12, 79
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
