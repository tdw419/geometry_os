; DESCRIPTION: Composite: Creates a magenta circular shape at (236, 149) with radius 73 then Places a black 77x77 rectangle at position (145, 10) then Sets a single green pixel at (211, 37).
; PLAN: r0=236(x), r1=149(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=10(y), r7=77(width), r8=77(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=211(x), r11=37(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 149
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 10
LDI r7, 77
LDI r8, 77
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 37
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
