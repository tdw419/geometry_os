; DESCRIPTION: Composite: Places a blue circle of radius 27 at center (271, 111) then Creates a green rectangular region at (134, 74) spanning 57 by 90 pixels then Places a green dot at position (248, 85).
; PLAN: r0=271(x), r1=111(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=74(y), r7=57(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x), r11=85(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 111
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 74
LDI r7, 57
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 85
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
