; DESCRIPTION: Composite: Sets a single blue pixel at (464, 121) then Places a orange 66x65 rectangle at position (344, 124) then Creates a red circular shape at (429, 38) with radius 32.
; PLAN: r0=464(x), r1=121(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=124(y), r7=66(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x), r11=38(y), r12=32(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 121
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 124
LDI r7, 66
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 38
LDI r12, 32
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
