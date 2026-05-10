; DESCRIPTION: Composite: Creates a blue circular shape at (401, 169) with radius 35 then Places a magenta 72x90 rectangle at position (376, 48) then Places a red dot at position (298, 199).
; PLAN: r0=401(x), r1=169(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=48(y), r7=72(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=298(x), r11=199(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 169
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 48
LDI r7, 72
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 199
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
