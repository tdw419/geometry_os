; DESCRIPTION: Composite: Draws a blue rectangle at (121, 151) with width 92 and height 99 then Places a magenta dot at position (289, 210) then Renders a white disk with center (275, 161) and radius 66.
; PLAN: r0=121(x), r1=151(y), r2=92(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=210(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=161(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 151
LDI r2, 92
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 210
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 275
LDI r11, 161
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
