; DESCRIPTION: Composite: Renders a cyan box of size 94x47 starting at (370, 96) then Renders a purple disk with center (89, 140) and radius 72 then Sets a single blue pixel at (293, 2).
; PLAN: r0=370(x), r1=96(y), r2=94(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=140(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x), r11=2(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 96
LDI r2, 94
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 140
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 2
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
