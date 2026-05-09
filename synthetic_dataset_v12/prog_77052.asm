; DESCRIPTION: Composite: Sets a single orange pixel at (146, 32) then Renders a magenta box of size 70x47 starting at (131, 14) then Creates a white circular shape at (80, 216) with radius 24.
; PLAN: r0=146(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=14(y), r7=70(width), r8=47(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x), r11=216(y), r12=24(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 32
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 131
LDI r6, 14
LDI r7, 70
LDI r8, 47
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 216
LDI r12, 24
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
