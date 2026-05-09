; DESCRIPTION: Composite: Creates a orange circular shape at (114, 91) with radius 45 then Places a red 90x111 rectangle at position (127, 45).
; PLAN: r0=114(x), r1=91(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=45(y), r7=90(width), r8=111(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 91
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 45
LDI r7, 90
LDI r8, 111
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
