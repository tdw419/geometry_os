; DESCRIPTION: Composite: Sets a single green pixel at (317, 55) then Renders a purple box of size 120x78 starting at (75, 40) then Places a purple circle of radius 46 at center (94, 91).
; PLAN: r0=317(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=40(y), r7=120(width), r8=78(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=91(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 40
LDI r7, 120
LDI r8, 78
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 91
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
