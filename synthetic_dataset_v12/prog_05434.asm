; DESCRIPTION: Composite: Places a cyan dot at position (44, 170) then Places a magenta circle of radius 21 at center (251, 129) then Renders a yellow box of size 98x84 starting at (8, 139).
; PLAN: r0=44(x), r1=170(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=129(y), r7=21(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x), r11=139(y), r12=98(width), r13=84(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 170
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 129
LDI r7, 21
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 139
LDI r12, 98
LDI r13, 84
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
