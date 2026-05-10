; DESCRIPTION: Composite: Places a orange 15x31 rectangle at position (328, 12) then Draws a black circle centered at (164, 129) with radius 79.
; PLAN: r0=328(x), r1=12(y), r2=15(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=129(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 12
LDI r2, 15
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 129
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
