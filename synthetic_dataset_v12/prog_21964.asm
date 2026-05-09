; DESCRIPTION: Composite: Sets a single green pixel at (67, 76) then Places a magenta line segment connecting (487, 135) to (20, 174) then Places a blue 20x10 rectangle at position (141, 156).
; PLAN: r0=67(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=487(x1), r6=135(y1), r7=20(x2), r8=174(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=156(y), r12=20(width), r13=10(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 487
LDI r6, 135
LDI r7, 20
LDI r8, 174
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 156
LDI r12, 20
LDI r13, 10
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
