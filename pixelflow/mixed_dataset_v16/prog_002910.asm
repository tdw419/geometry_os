; DESCRIPTION: Composite: Renders a green disk with center (360, 173) and radius 61 then Sets a single red pixel at (303, 141) then Draws a cyan rectangle at (415, 22) with width 17 and height 117.
; PLAN: r0=360(x), r1=173(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x), r6=141(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=22(y), r12=17(width), r13=117(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 173
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 141
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 415
LDI r11, 22
LDI r12, 17
LDI r13, 117
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
