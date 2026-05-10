; DESCRIPTION: Composite: Draws a yellow rectangle at (123, 127) with width 111 and height 35 then Renders a cyan disk with center (342, 162) and radius 17 then Sets a single white pixel at (398, 164).
; PLAN: r0=123(x), r1=127(y), r2=111(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=162(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=398(x), r11=164(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 123
LDI r1, 127
LDI r2, 111
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 162
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 398
LDI r11, 164
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
