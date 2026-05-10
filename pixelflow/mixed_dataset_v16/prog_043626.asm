; DESCRIPTION: Composite: Creates a red circular shape at (228, 128) with radius 16 then Sets a single blue pixel at (399, 125) then Renders a white box of size 40x69 starting at (462, 113).
; PLAN: r0=228(x), r1=128(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=125(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=462(x), r11=113(y), r12=40(width), r13=69(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 128
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 125
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 462
LDI r11, 113
LDI r12, 40
LDI r13, 69
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
