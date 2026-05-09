; DESCRIPTION: Composite: Places a cyan circle of radius 24 at center (272, 165) then Places a magenta 102x24 rectangle at position (25, 229) then Places a purple dot at position (25, 16).
; PLAN: r0=272(x), r1=165(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=229(y), r7=102(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=25(x), r11=16(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 165
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 229
LDI r7, 102
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 16
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
