; DESCRIPTION: Composite: Places a black 59x109 rectangle at position (192, 15) then Renders a magenta disk with center (441, 205) and radius 28.
; PLAN: r0=192(x), r1=15(y), r2=59(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=205(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 192
LDI r1, 15
LDI r2, 59
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 205
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
