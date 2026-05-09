; DESCRIPTION: Composite: Renders a purple disk with center (46, 29) and radius 29 then Draws a cyan rectangle at (352, 115) with width 103 and height 88.
; PLAN: r0=46(x), r1=29(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=115(y), r7=103(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 29
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 115
LDI r7, 103
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
