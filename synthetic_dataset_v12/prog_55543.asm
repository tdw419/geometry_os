; DESCRIPTION: Composite: Draws a cyan circle centered at (197, 162) with radius 52 then Places a yellow 20x29 rectangle at position (132, 45).
; PLAN: r0=197(x), r1=162(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=45(y), r7=20(width), r8=29(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 162
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 45
LDI r7, 20
LDI r8, 29
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
