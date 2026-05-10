; DESCRIPTION: Composite: Sets a single blue pixel at (150, 48) then Draws a blue rectangle at (223, 188) with width 10 and height 47 then Places a green circle of radius 18 at center (284, 92).
; PLAN: r0=150(x), r1=48(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=188(y), r7=10(width), r8=47(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=284(x), r11=92(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 48
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 188
LDI r7, 10
LDI r8, 47
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 92
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
