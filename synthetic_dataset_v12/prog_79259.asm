; DESCRIPTION: Composite: Sets a single green pixel at (160, 176) then Renders a blue disk with center (284, 47) and radius 19 then Draws a cyan rectangle at (214, 111) with width 22 and height 35.
; PLAN: r0=160(x), r1=176(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=47(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=214(x), r11=111(y), r12=22(width), r13=35(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 176
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 284
LDI r6, 47
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 214
LDI r11, 111
LDI r12, 22
LDI r13, 35
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
