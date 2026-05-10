; DESCRIPTION: Composite: Places a red dot at position (288, 144) then Renders a white disk with center (283, 169) and radius 11 then Places a red 45x79 rectangle at position (193, 46).
; PLAN: r0=288(x), r1=144(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=169(y), r7=11(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=193(x), r11=46(y), r12=45(width), r13=79(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 144
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 283
LDI r6, 169
LDI r7, 11
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 193
LDI r11, 46
LDI r12, 45
LDI r13, 79
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
