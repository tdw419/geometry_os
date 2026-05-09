; DESCRIPTION: Composite: Places a purple 113x63 rectangle at position (153, 167) then Creates a blue circular shape at (301, 112) with radius 79 then Sets a single cyan pixel at (59, 217).
; PLAN: r0=153(x), r1=167(y), r2=113(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=112(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=59(x), r11=217(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 167
LDI r2, 113
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 112
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 59
LDI r11, 217
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
