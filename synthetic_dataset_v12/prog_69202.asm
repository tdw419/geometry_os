; DESCRIPTION: Composite: Renders a white box of size 15x76 starting at (9, 121) then Renders a magenta disk with center (339, 165) and radius 66 then Renders a cyan line between points (387, 243) and (480, 104).
; PLAN: r0=9(x), r1=121(y), r2=15(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=165(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=387(x1), r11=243(y1), r12=480(x2), r13=104(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 121
LDI r2, 15
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 165
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 387
LDI r11, 243
LDI r12, 480
LDI r13, 104
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
