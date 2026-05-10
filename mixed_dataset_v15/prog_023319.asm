; DESCRIPTION: Composite: Places a yellow circle of radius 59 at center (265, 124) then Renders a red box of size 105x40 starting at (58, 172).
; PLAN: r0=265(x), r1=124(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=172(y), r7=105(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 124
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 172
LDI r7, 105
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
