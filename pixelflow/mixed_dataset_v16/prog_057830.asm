; DESCRIPTION: Composite: Sets a single green pixel at (267, 18) then Draws a red rectangle at (46, 152) with width 90 and height 100 then Creates a white circular shape at (422, 116) with radius 18.
; PLAN: r0=267(x), r1=18(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=152(y), r7=90(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=116(y), r12=18(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 18
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 46
LDI r6, 152
LDI r7, 90
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 116
LDI r12, 18
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
