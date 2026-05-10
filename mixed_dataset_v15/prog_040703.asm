; DESCRIPTION: Composite: Places a red 58x101 rectangle at position (309, 152) then Draws a cyan circle centered at (211, 196) with radius 53.
; PLAN: r0=309(x), r1=152(y), r2=58(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=196(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 309
LDI r1, 152
LDI r2, 58
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 196
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
