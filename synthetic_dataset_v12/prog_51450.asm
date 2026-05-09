; DESCRIPTION: Composite: Places a purple dot at position (249, 250) then Draws a orange rectangle at (295, 30) with width 63 and height 107 then Renders a white disk with center (275, 81) and radius 52.
; PLAN: r0=249(x), r1=250(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=30(y), r7=63(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=275(x), r11=81(y), r12=52(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 250
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 30
LDI r7, 63
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 81
LDI r12, 52
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
