; DESCRIPTION: Composite: Renders a blue disk with center (400, 127) and radius 66 then Renders a red box of size 29x18 starting at (104, 29).
; PLAN: r0=400(x), r1=127(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=29(y), r7=29(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 127
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 29
LDI r7, 29
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
