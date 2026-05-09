; DESCRIPTION: Composite: Sets a single purple pixel at (250, 55) then Places a magenta line segment connecting (400, 255) to (341, 242) then Places a blue 18x74 rectangle at position (375, 96).
; PLAN: r0=250(x), r1=55(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=400(x1), r6=255(y1), r7=341(x2), r8=242(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=375(x), r11=96(y), r12=18(width), r13=74(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 55
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 255
LDI r7, 341
LDI r8, 242
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 96
LDI r12, 18
LDI r13, 74
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
