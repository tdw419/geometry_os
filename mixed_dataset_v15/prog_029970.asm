; DESCRIPTION: Composite: Renders a yellow box of size 25x115 starting at (315, 108) then Draws a yellow circle centered at (144, 146) with radius 67.
; PLAN: r0=315(x), r1=108(y), r2=25(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=146(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 108
LDI r2, 25
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 146
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
