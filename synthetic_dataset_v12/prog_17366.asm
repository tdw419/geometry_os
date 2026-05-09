; DESCRIPTION: Composite: Places a purple dot at position (61, 191) then Creates a blue rectangular region at (294, 216) spanning 74 by 37 pixels then Places a orange line segment connecting (103, 59) to (10, 42).
; PLAN: r0=61(x), r1=191(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=216(y), r7=74(width), r8=37(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=103(x1), r11=59(y1), r12=10(x2), r13=42(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 191
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 216
LDI r7, 74
LDI r8, 37
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 59
LDI r12, 10
LDI r13, 42
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
