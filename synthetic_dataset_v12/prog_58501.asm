; DESCRIPTION: Composite: Places a magenta circle of radius 71 at center (351, 129) then Places a orange dot at position (500, 163) then Places a cyan 59x81 rectangle at position (22, 85).
; PLAN: r0=351(x), r1=129(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=500(x), r6=163(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=22(x), r11=85(y), r12=59(width), r13=81(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 129
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 500
LDI r6, 163
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 22
LDI r11, 85
LDI r12, 59
LDI r13, 81
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
