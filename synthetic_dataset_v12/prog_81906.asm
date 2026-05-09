; DESCRIPTION: Composite: Places a yellow 59x89 rectangle at position (298, 56) then Places a magenta circle of radius 35 at center (301, 151) then Places a white dot at position (504, 100).
; PLAN: r0=298(x), r1=56(y), r2=59(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=151(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x), r11=100(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 56
LDI r2, 59
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 151
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 100
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
