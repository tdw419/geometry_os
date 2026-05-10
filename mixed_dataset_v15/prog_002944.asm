; DESCRIPTION: Composite: Creates a magenta circular shape at (108, 39) with radius 26 then Places a magenta 107x81 rectangle at position (397, 65) then Sets a single cyan pixel at (34, 219).
; PLAN: r0=108(x), r1=39(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=65(y), r7=107(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x), r11=219(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 39
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 65
LDI r7, 107
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 219
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
