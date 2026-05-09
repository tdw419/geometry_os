; DESCRIPTION: Composite: Places a magenta circle of radius 10 at center (211, 150) then Creates a orange rectangular region at (12, 116) spanning 80 by 46 pixels then Places a red dot at position (162, 14).
; PLAN: r0=211(x), r1=150(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=116(y), r7=80(width), r8=46(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=14(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 150
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 116
LDI r7, 80
LDI r8, 46
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 14
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
