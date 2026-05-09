; DESCRIPTION: Composite: Renders a cyan disk with center (440, 198) and radius 50 then Sets a single white pixel at (487, 140) then Draws a blue rectangle at (276, 168) with width 96 and height 59.
; PLAN: r0=440(x), r1=198(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x), r6=140(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=276(x), r11=168(y), r12=96(width), r13=59(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 198
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 140
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 276
LDI r11, 168
LDI r12, 96
LDI r13, 59
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
