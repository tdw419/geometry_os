; DESCRIPTION: Composite: Sets a single orange pixel at (146, 46) then Creates a orange circular shape at (162, 129) with radius 50 then Draws a orange rectangle at (235, 48) with width 55 and height 68.
; PLAN: r0=146(x), r1=46(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=129(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=48(y), r12=55(width), r13=68(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 46
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 162
LDI r6, 129
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 48
LDI r12, 55
LDI r13, 68
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
