; DESCRIPTION: Composite: Places a orange circle of radius 28 at center (106, 118) then Renders a blue box of size 72x98 starting at (156, 46) then Sets a single magenta pixel at (422, 131).
; PLAN: r0=106(x), r1=118(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=46(y), r7=72(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=131(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 118
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 46
LDI r7, 72
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 131
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
