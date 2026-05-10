; DESCRIPTION: Composite: Places a green dot at position (440, 138) then Renders a black disk with center (211, 161) and radius 68 then Places a green 120x104 rectangle at position (219, 28).
; PLAN: r0=440(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=161(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=219(x), r11=28(y), r12=120(width), r13=104(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 211
LDI r6, 161
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 219
LDI r11, 28
LDI r12, 120
LDI r13, 104
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
