; DESCRIPTION: Composite: Places a white circle of radius 10 at center (102, 99) then Places a white 49x51 rectangle at position (116, 61) then Places a yellow dot at position (92, 63).
; PLAN: r0=102(x), r1=99(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=61(y), r7=49(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x), r11=63(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 102
LDI r1, 99
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 61
LDI r7, 49
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 63
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
