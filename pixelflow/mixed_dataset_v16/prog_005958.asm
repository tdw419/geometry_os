; DESCRIPTION: Composite: Sets a single green pixel at (257, 16) then Places a white 70x11 rectangle at position (78, 223) then Renders a orange line between points (8, 5) and (39, 199).
; PLAN: r0=257(x), r1=16(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=223(y), r7=70(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=8(x1), r11=5(y1), r12=39(x2), r13=199(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 16
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 78
LDI r6, 223
LDI r7, 70
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 8
LDI r11, 5
LDI r12, 39
LDI r13, 199
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
