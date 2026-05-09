; DESCRIPTION: Composite: Renders a blue disk with center (430, 103) and radius 71 then Places a orange dot at position (320, 213) then Renders a orange box of size 25x40 starting at (5, 6).
; PLAN: r0=430(x), r1=103(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=213(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=5(x), r11=6(y), r12=25(width), r13=40(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 103
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 213
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 5
LDI r11, 6
LDI r12, 25
LDI r13, 40
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
