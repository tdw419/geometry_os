; DESCRIPTION: Composite: Renders a magenta disk with center (162, 215) and radius 29 then Renders a red box of size 67x105 starting at (359, 48) then Places a yellow dot at position (105, 30).
; PLAN: r0=162(x), r1=215(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x), r6=48(y), r7=67(width), r8=105(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x), r11=30(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 162
LDI r1, 215
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 48
LDI r7, 67
LDI r8, 105
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 30
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
