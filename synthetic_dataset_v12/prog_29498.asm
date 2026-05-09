; DESCRIPTION: Composite: Renders a black box of size 100x66 starting at (111, 104) then Places a cyan circle of radius 64 at center (399, 85).
; PLAN: r0=111(x), r1=104(y), r2=100(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x), r6=85(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 104
LDI r2, 100
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 85
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
