; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (104, 89) with width 23 and height 99. Then Draws a cyan circle centered at (104, 137) with radius 76.
; PLAN: r0=104(x), r1=89(y), r2=23(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x), r1=137(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (104, 89) with width 23 and height 99.
; PLAN: r0=104(x), r1=89(y), r2=23(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 89
LDI r2, 23
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan circle centered at (104, 137) with radius 76.
; PLAN: r0=104(x), r1=137(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 137
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
