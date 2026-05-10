; DESCRIPTION: Composite: Places a white dot at position (256, 50) then Draws a yellow circle centered at (403, 49) with radius 33 then Draws a red rectangle at (392, 215) with width 25 and height 31.
; PLAN: r0=256(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=49(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=392(x), r11=215(y), r12=25(width), r13=31(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 403
LDI r6, 49
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 392
LDI r11, 215
LDI r12, 25
LDI r13, 31
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
