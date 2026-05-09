; DESCRIPTION: Composite: Draws a blue circle centered at (442, 52) with radius 19 then Places a yellow 47x77 rectangle at position (328, 161).
; PLAN: r0=442(x), r1=52(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=161(y), r7=47(width), r8=77(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 52
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 161
LDI r7, 47
LDI r8, 77
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
