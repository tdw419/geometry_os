; DESCRIPTION: Composite: Renders a cyan box of size 59x40 starting at (289, 30) then Creates a blue circular shape at (243, 70) with radius 35 then Sets a single magenta pixel at (197, 132).
; PLAN: r0=289(x), r1=30(y), r2=59(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=70(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=197(x), r11=132(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 30
LDI r2, 59
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 70
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 197
LDI r11, 132
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
