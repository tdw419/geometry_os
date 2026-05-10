; DESCRIPTION: Composite: Places a blue 96x71 rectangle at position (198, 185) then Renders a green disk with center (299, 135) and radius 68 then Places a white dot at position (239, 132).
; PLAN: r0=198(x), r1=185(y), r2=96(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=135(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x), r11=132(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 185
LDI r2, 96
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 135
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 132
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
