; DESCRIPTION: Composite: Sets a single purple pixel at (212, 77) then Places a green circle of radius 28 at center (443, 33) then Places a green 104x24 rectangle at position (260, 7).
; PLAN: r0=212(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=443(x), r6=33(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=260(x), r11=7(y), r12=104(width), r13=24(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 443
LDI r6, 33
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 260
LDI r11, 7
LDI r12, 104
LDI r13, 24
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
