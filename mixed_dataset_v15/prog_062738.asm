; DESCRIPTION: Composite: Places a blue dot at position (35, 16) then Draws a blue circle centered at (293, 110) with radius 76 then Renders a green box of size 32x64 starting at (253, 125).
; PLAN: r0=35(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=110(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=253(x), r11=125(y), r12=32(width), r13=64(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 293
LDI r6, 110
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 253
LDI r11, 125
LDI r12, 32
LDI r13, 64
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
