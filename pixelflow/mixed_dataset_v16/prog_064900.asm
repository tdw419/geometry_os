; DESCRIPTION: Composite: Draws a white rectangle at (265, 79) with width 91 and height 97 then Places a orange dot at position (25, 120) then Creates a white circular shape at (305, 93) with radius 43.
; PLAN: r0=265(x), r1=79(y), r2=91(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x), r6=120(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=305(x), r11=93(y), r12=43(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 79
LDI r2, 91
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 120
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 305
LDI r11, 93
LDI r12, 43
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
