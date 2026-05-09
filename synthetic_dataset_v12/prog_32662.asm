; DESCRIPTION: Composite: Sets a single green pixel at (268, 207) then Places a yellow 44x22 rectangle at position (36, 34) then Creates a cyan circular shape at (183, 152) with radius 33.
; PLAN: r0=268(x), r1=207(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=34(y), r7=44(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=183(x), r11=152(y), r12=33(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 207
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 36
LDI r6, 34
LDI r7, 44
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 152
LDI r12, 33
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
