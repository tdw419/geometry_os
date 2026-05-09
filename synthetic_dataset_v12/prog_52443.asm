; DESCRIPTION: Composite: Sets a single cyan pixel at (285, 10) then Creates a purple rectangular region at (243, 42) spanning 118 by 88 pixels then Places a green line segment connecting (76, 245) to (21, 64).
; PLAN: r0=285(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=42(y), r7=118(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x1), r11=245(y1), r12=21(x2), r13=64(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 42
LDI r7, 118
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 245
LDI r12, 21
LDI r13, 64
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
