; DESCRIPTION: Composite: Sets a single orange pixel at (54, 13) then Renders a yellow disk with center (181, 152) and radius 67 then Places a white 73x10 rectangle at position (120, 0).
; PLAN: r0=54(x), r1=13(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=152(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=0(y), r12=73(width), r13=10(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 13
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 181
LDI r6, 152
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 0
LDI r12, 73
LDI r13, 10
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
