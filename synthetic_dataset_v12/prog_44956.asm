; DESCRIPTION: Composite: Places a cyan 43x60 rectangle at position (262, 82) then Places a cyan circle of radius 17 at center (69, 223) then Places a blue dot at position (17, 114).
; PLAN: r0=262(x), r1=82(y), r2=43(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=223(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=17(x), r11=114(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 262
LDI r1, 82
LDI r2, 43
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 223
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 17
LDI r11, 114
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
