; DESCRIPTION: Composite: Places a orange 57x12 rectangle at position (143, 26) then Draws a cyan circle centered at (63, 77) with radius 33.
; PLAN: r0=143(x), r1=26(y), r2=57(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=77(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 26
LDI r2, 57
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 77
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
