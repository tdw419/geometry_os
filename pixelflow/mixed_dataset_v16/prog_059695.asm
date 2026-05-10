; DESCRIPTION: Composite: Places a purple dot at position (29, 99) then Places a white 67x56 rectangle at position (401, 130) then Places a yellow circle of radius 35 at center (111, 184).
; PLAN: r0=29(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=130(y), r7=67(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=184(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 29
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 130
LDI r7, 67
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 184
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
