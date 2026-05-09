; DESCRIPTION: Composite: Creates a black circular shape at (301, 172) with radius 48 then Places a orange dot at position (327, 231) then Creates a cyan rectangular region at (182, 32) spanning 32 by 42 pixels.
; PLAN: r0=301(x), r1=172(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=231(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=182(x), r11=32(y), r12=32(width), r13=42(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 172
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 231
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 182
LDI r11, 32
LDI r12, 32
LDI r13, 42
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
