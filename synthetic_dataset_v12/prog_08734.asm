; DESCRIPTION: Composite: Sets a single blue pixel at (496, 7) then Creates a blue rectangular region at (45, 120) spanning 81 by 38 pixels then Places a cyan line segment connecting (46, 196) to (28, 250).
; PLAN: r0=496(x), r1=7(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=120(y), r7=81(width), r8=38(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x1), r11=196(y1), r12=28(x2), r13=250(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 7
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 120
LDI r7, 81
LDI r8, 38
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 196
LDI r12, 28
LDI r13, 250
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
