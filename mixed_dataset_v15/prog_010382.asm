; DESCRIPTION: Composite: Sets a single cyan pixel at (434, 32) then Creates a blue rectangular region at (33, 119) spanning 113 by 11 pixels then Places a white line segment connecting (188, 87) to (414, 51).
; PLAN: r0=434(x), r1=32(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=119(y), r7=113(width), r8=11(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=188(x1), r11=87(y1), r12=414(x2), r13=51(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 32
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 33
LDI r6, 119
LDI r7, 113
LDI r8, 11
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 87
LDI r12, 414
LDI r13, 51
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
