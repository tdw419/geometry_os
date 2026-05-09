; DESCRIPTION: Composite: Sets a single green pixel at (356, 194) then Draws a green circle centered at (210, 80) with radius 12 then Places a white 84x32 rectangle at position (7, 198).
; PLAN: r0=356(x), r1=194(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=80(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=7(x), r11=198(y), r12=84(width), r13=32(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 194
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 210
LDI r6, 80
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 7
LDI r11, 198
LDI r12, 84
LDI r13, 32
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
