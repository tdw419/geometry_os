; DESCRIPTION: Composite: Draws a black circle centered at (172, 138) with radius 80 then Places a cyan 41x63 rectangle at position (259, 99).
; PLAN: r0=172(x), r1=138(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=99(y), r7=41(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 138
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 99
LDI r7, 41
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
