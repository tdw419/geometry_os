; DESCRIPTION: Composite: Renders a purple box of size 15x13 starting at (210, 140) then Renders a purple disk with center (374, 113) and radius 76 then Sets a single red pixel at (23, 196).
; PLAN: r0=210(x), r1=140(y), r2=15(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=113(y), r7=76(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=23(x), r11=196(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 140
LDI r2, 15
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 113
LDI r7, 76
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 23
LDI r11, 196
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
