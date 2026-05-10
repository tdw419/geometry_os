; DESCRIPTION: Composite: Sets a single yellow pixel at (174, 209) then Renders a green box of size 48x70 starting at (33, 170) then Places a black circle of radius 16 at center (141, 209).
; PLAN: r0=174(x), r1=209(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=170(y), r7=48(width), r8=70(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x), r11=209(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 209
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 33
LDI r6, 170
LDI r7, 48
LDI r8, 70
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 209
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
