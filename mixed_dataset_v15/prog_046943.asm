; DESCRIPTION: Composite: Renders a cyan line between points (313, 78) and (117, 158) then Sets a single purple pixel at (326, 11) then Creates a white rectangular region at (228, 154) spanning 23 by 35 pixels.
; PLAN: r0=313(x1), r1=78(y1), r2=117(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=11(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=228(x), r11=154(y), r12=23(width), r13=35(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 78
LDI r2, 117
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 11
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 228
LDI r11, 154
LDI r12, 23
LDI r13, 35
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
