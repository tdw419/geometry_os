; DESCRIPTION: Composite: Places a blue dot at position (374, 185) then Renders a blue disk with center (429, 70) and radius 12 then Draws a cyan rectangle at (217, 90) with width 49 and height 53.
; PLAN: r0=374(x), r1=185(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=70(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=90(y), r12=49(width), r13=53(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 185
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 70
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 90
LDI r12, 49
LDI r13, 53
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
