; DESCRIPTION: Composite: Sets a single green pixel at (66, 60) then Places a cyan 99x19 rectangle at position (191, 71) then Places a blue circle of radius 52 at center (409, 105).
; PLAN: r0=66(x), r1=60(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=71(y), r7=99(width), r8=19(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x), r11=105(y), r12=52(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 60
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 191
LDI r6, 71
LDI r7, 99
LDI r8, 19
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 105
LDI r12, 52
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
