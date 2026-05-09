; DESCRIPTION: Composite: Sets a single black pixel at (405, 215) then Places a purple 38x104 rectangle at position (450, 15) then Renders a white disk with center (132, 73) and radius 48.
; PLAN: r0=405(x), r1=215(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=15(y), r7=38(width), r8=104(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x), r11=73(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 405
LDI r1, 215
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 450
LDI r6, 15
LDI r7, 38
LDI r8, 104
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 73
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
