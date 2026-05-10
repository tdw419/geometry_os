; DESCRIPTION: Composite: Places a green dot at position (18, 205) then Places a cyan circle of radius 78 at center (124, 89) then Places a orange 73x118 rectangle at position (126, 60).
; PLAN: r0=18(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=89(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=126(x), r11=60(y), r12=73(width), r13=118(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 205
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 124
LDI r6, 89
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 126
LDI r11, 60
LDI r12, 73
LDI r13, 118
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
