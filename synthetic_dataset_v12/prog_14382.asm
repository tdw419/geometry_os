; DESCRIPTION: Composite: Places a white dot at position (104, 113) then Renders a yellow box of size 30x102 starting at (235, 12) then Renders a yellow disk with center (110, 27) and radius 11.
; PLAN: r0=104(x), r1=113(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=12(y), r7=30(width), r8=102(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=110(x), r11=27(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 104
LDI r1, 113
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 12
LDI r7, 30
LDI r8, 102
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 27
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
