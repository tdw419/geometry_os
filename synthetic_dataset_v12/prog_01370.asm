; DESCRIPTION: Composite: Places a black 87x48 rectangle at position (392, 128) then Draws a cyan circle centered at (292, 192) with radius 57 then Places a blue line segment connecting (295, 199) to (131, 155).
; PLAN: r0=392(x), r1=128(y), r2=87(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x), r6=192(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x1), r11=199(y1), r12=131(x2), r13=155(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 128
LDI r2, 87
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 192
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 199
LDI r12, 131
LDI r13, 155
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
