; DESCRIPTION: Composite: Sets a single cyan pixel at (473, 135) then Places a white 91x62 rectangle at position (353, 190) then Renders a magenta line between points (0, 153) and (119, 101).
; PLAN: r0=473(x), r1=135(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=190(y), r7=91(width), r8=62(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=0(x1), r11=153(y1), r12=119(x2), r13=101(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 135
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 190
LDI r7, 91
LDI r8, 62
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 153
LDI r12, 119
LDI r13, 101
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
