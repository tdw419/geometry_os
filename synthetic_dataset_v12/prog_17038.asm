; DESCRIPTION: Composite: Sets a single red pixel at (332, 176) then Renders a yellow line between points (30, 90) and (315, 210) then Places a white 102x18 rectangle at position (49, 154).
; PLAN: r0=332(x), r1=176(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=90(y1), r7=315(x2), r8=210(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=154(y), r12=102(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 176
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 30
LDI r6, 90
LDI r7, 315
LDI r8, 210
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 154
LDI r12, 102
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
