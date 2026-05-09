; DESCRIPTION: Composite: Renders a cyan box of size 59x87 starting at (103, 93) then Draws a black circle centered at (139, 178) with radius 72 then Sets a single orange pixel at (22, 193).
; PLAN: r0=103(x), r1=93(y), r2=59(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=178(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=193(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 103
LDI r1, 93
LDI r2, 59
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 178
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 193
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
