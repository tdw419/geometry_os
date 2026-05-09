; DESCRIPTION: Composite: Places a green 19x47 rectangle at position (404, 105) then Places a white dot at position (143, 187) then Draws a cyan circle centered at (428, 96) with radius 52.
; PLAN: r0=404(x), r1=105(y), r2=19(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=187(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=428(x), r11=96(y), r12=52(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 404
LDI r1, 105
LDI r2, 19
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 187
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 428
LDI r11, 96
LDI r12, 52
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
