; DESCRIPTION: Composite: Places a magenta dot at position (171, 211) then Places a blue line segment connecting (12, 13) to (89, 176) then Creates a red rectangular region at (405, 56) spanning 20 by 46 pixels.
; PLAN: r0=171(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=12(x1), r6=13(y1), r7=89(x2), r8=176(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=56(y), r12=20(width), r13=46(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 12
LDI r6, 13
LDI r7, 89
LDI r8, 176
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 56
LDI r12, 20
LDI r13, 46
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
