; DESCRIPTION: Composite: Creates a black circular shape at (200, 124) with radius 44 then Places a orange 16x51 rectangle at position (216, 170).
; PLAN: r0=200(x), r1=124(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=170(y), r7=16(width), r8=51(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 124
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 170
LDI r7, 16
LDI r8, 51
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
