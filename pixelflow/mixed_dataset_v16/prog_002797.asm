; DESCRIPTION: Composite: Sets a single cyan pixel at (121, 231) then Places a purple circle of radius 38 at center (140, 160) then Places a purple 12x79 rectangle at position (295, 7).
; PLAN: r0=121(x), r1=231(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=160(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x), r11=7(y), r12=12(width), r13=79(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 231
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 160
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 7
LDI r12, 12
LDI r13, 79
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
