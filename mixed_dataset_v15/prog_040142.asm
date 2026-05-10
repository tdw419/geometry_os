; DESCRIPTION: Composite: Places a black circle of radius 19 at center (334, 59) then Renders a red box of size 33x22 starting at (63, 76).
; PLAN: r0=334(x), r1=59(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=76(y), r7=33(width), r8=22(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 59
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 76
LDI r7, 33
LDI r8, 22
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
