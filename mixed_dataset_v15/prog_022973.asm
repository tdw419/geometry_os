; DESCRIPTION: Composite: Places a blue 64x74 rectangle at position (411, 144) then Creates a orange circular shape at (304, 46) with radius 38.
; PLAN: r0=411(x), r1=144(y), r2=64(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=46(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 144
LDI r2, 64
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 46
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
