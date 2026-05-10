; DESCRIPTION: Composite: Sets a single cyan pixel at (376, 207) then Places a red line segment connecting (275, 220) to (141, 138) then Renders a magenta box of size 77x36 starting at (114, 25).
; PLAN: r0=376(x), r1=207(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=220(y1), r7=141(x2), r8=138(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=25(y), r12=77(width), r13=36(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 207
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 275
LDI r6, 220
LDI r7, 141
LDI r8, 138
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 25
LDI r12, 77
LDI r13, 36
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
