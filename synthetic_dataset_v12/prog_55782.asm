; DESCRIPTION: Composite: Renders a red box of size 111x49 starting at (370, 197) then Places a cyan circle of radius 69 at center (223, 182) then Sets a single orange pixel at (99, 240).
; PLAN: r0=370(x), r1=197(y), r2=111(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=182(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x), r11=240(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 197
LDI r2, 111
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 182
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 240
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
