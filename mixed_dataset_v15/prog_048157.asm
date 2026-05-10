; DESCRIPTION: Composite: Creates a white circular shape at (88, 111) with radius 58 then Places a blue 120x89 rectangle at position (307, 4) then Places a magenta dot at position (223, 234).
; PLAN: r0=88(x), r1=111(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=4(y), r7=120(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=223(x), r11=234(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 111
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 4
LDI r7, 120
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 234
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
