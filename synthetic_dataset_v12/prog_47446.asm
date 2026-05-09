; DESCRIPTION: Composite: Renders a yellow disk with center (149, 190) and radius 14 then Places a orange 15x89 rectangle at position (278, 89).
; PLAN: r0=149(x), r1=190(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=89(y), r7=15(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 190
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 89
LDI r7, 15
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
