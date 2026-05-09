; DESCRIPTION: Composite: Creates a blue circular shape at (168, 148) with radius 76 then Renders a blue box of size 78x98 starting at (307, 23) then Places a green dot at position (441, 51).
; PLAN: r0=168(x), r1=148(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=23(y), r7=78(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=51(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 168
LDI r1, 148
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 23
LDI r7, 78
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 51
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
