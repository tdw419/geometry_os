; DESCRIPTION: Composite: Sets a single purple pixel at (301, 47) then Creates a orange circular shape at (363, 79) with radius 78 then Renders a yellow box of size 115x78 starting at (81, 117).
; PLAN: r0=301(x), r1=47(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=79(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x), r11=117(y), r12=115(width), r13=78(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 47
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 79
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 117
LDI r12, 115
LDI r13, 78
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
