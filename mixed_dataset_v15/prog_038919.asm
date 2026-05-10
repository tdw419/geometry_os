; DESCRIPTION: Composite: Places a white 40x10 rectangle at position (419, 135) then Draws a green circle centered at (411, 96) with radius 72 then Sets a single orange pixel at (221, 193).
; PLAN: r0=419(x), r1=135(y), r2=40(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=96(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x), r11=193(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 419
LDI r1, 135
LDI r2, 40
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 96
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 193
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
