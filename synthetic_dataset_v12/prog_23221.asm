; DESCRIPTION: Composite: Places a red 34x110 rectangle at position (9, 59) then Places a cyan circle of radius 37 at center (84, 63).
; PLAN: r0=9(x), r1=59(y), r2=34(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=63(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 59
LDI r2, 34
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 63
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
