; DESCRIPTION: Composite: Places a green circle of radius 80 at center (373, 175) then Renders a cyan box of size 16x65 starting at (210, 4) then Places a black dot at position (270, 102).
; PLAN: r0=373(x), r1=175(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=4(y), r7=16(width), r8=65(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=102(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 175
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 4
LDI r7, 16
LDI r8, 65
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 102
LDI r12, 0x000000
PSET r10, r11, r12
HALT
