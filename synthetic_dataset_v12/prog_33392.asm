; DESCRIPTION: Composite: Sets a single blue pixel at (255, 123) then Places a cyan circle of radius 47 at center (168, 98) then Places a black line segment connecting (134, 213) to (150, 210).
; PLAN: r0=255(x), r1=123(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=98(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=134(x1), r11=213(y1), r12=150(x2), r13=210(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 123
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 98
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 134
LDI r11, 213
LDI r12, 150
LDI r13, 210
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
