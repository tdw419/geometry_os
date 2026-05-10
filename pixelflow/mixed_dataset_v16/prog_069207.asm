; DESCRIPTION: Composite: Sets a single red pixel at (301, 67) then Renders a orange box of size 25x34 starting at (255, 148) then Places a white circle of radius 22 at center (385, 232).
; PLAN: r0=301(x), r1=67(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=148(y), r7=25(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x), r11=232(y), r12=22(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 67
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 255
LDI r6, 148
LDI r7, 25
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 232
LDI r12, 22
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
