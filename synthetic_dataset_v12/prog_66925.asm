; DESCRIPTION: Composite: Places a red circle of radius 40 at center (167, 197) then Places a orange line segment connecting (175, 254) to (0, 46) then Sets a single cyan pixel at (409, 113).
; PLAN: r0=167(x), r1=197(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x1), r6=254(y1), r7=0(x2), r8=46(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=113(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 197
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 254
LDI r7, 0
LDI r8, 46
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 113
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
