; DESCRIPTION: Composite: Places a cyan circle of radius 28 at center (461, 102) then Renders a yellow box of size 86x15 starting at (84, 56).
; PLAN: r0=461(x), r1=102(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x), r6=56(y), r7=86(width), r8=15(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 102
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 56
LDI r7, 86
LDI r8, 15
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
