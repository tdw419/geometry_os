; DESCRIPTION: Composite: Places a green circle of radius 46 at center (402, 114) then Places a black 117x25 rectangle at position (166, 81).
; PLAN: r0=402(x), r1=114(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=81(y), r7=117(width), r8=25(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 114
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 81
LDI r7, 117
LDI r8, 25
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
