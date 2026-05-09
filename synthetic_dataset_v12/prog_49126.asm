; DESCRIPTION: Composite: Sets a single green pixel at (215, 25) then Draws a blue rectangle at (365, 107) with width 57 and height 47 then Creates a yellow circular shape at (100, 50) with radius 25.
; PLAN: r0=215(x), r1=25(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=107(y), r7=57(width), r8=47(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=50(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 25
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 365
LDI r6, 107
LDI r7, 57
LDI r8, 47
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 50
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
