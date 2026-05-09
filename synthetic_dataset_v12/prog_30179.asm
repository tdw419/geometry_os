; DESCRIPTION: Composite: Renders a yellow box of size 110x10 starting at (335, 115) then Places a cyan circle of radius 13 at center (78, 88).
; PLAN: r0=335(x), r1=115(y), r2=110(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=88(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 115
LDI r2, 110
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 88
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
