; DESCRIPTION: Composite: Renders a cyan box of size 53x103 starting at (2, 104) then Places a black circle of radius 32 at center (248, 174).
; PLAN: r0=2(x), r1=104(y), r2=53(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=174(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 2
LDI r1, 104
LDI r2, 53
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 174
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
