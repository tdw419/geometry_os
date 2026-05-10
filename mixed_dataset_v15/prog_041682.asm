; DESCRIPTION: Composite: Places a cyan 55x32 rectangle at position (144, 21) then Creates a orange circular shape at (204, 129) with radius 45.
; PLAN: r0=144(x), r1=21(y), r2=55(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=129(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 144
LDI r1, 21
LDI r2, 55
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 129
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
