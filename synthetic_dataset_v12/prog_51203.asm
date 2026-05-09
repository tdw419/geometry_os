; DESCRIPTION: Composite: Draws a orange rectangle at (61, 84) with width 64 and height 52 then Places a magenta dot at position (328, 132) then Renders a green disk with center (382, 115) and radius 60.
; PLAN: r0=61(x), r1=84(y), r2=64(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=132(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=382(x), r11=115(y), r12=60(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 84
LDI r2, 64
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 132
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 382
LDI r11, 115
LDI r12, 60
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
