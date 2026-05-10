; DESCRIPTION: Composite: Places a green dot at position (435, 205) then Draws a green rectangle at (239, 196) with width 84 and height 18 then Creates a cyan circular shape at (307, 112) with radius 33.
; PLAN: r0=435(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=196(y), r7=84(width), r8=18(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=307(x), r11=112(y), r12=33(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 435
LDI r1, 205
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 239
LDI r6, 196
LDI r7, 84
LDI r8, 18
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 112
LDI r12, 33
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
