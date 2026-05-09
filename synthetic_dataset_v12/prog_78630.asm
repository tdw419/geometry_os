; DESCRIPTION: Composite: Creates a cyan circular shape at (193, 134) with radius 67 then Places a cyan dot at position (63, 127) then Creates a green rectangular region at (126, 87) spanning 115 by 113 pixels.
; PLAN: r0=193(x), r1=134(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=127(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=87(y), r12=115(width), r13=113(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 134
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 127
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 126
LDI r11, 87
LDI r12, 115
LDI r13, 113
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
