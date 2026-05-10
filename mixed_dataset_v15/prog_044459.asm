; DESCRIPTION: Composite: Places a cyan 14x27 rectangle at position (57, 123) then Places a purple line segment connecting (180, 250) to (256, 124) then Renders a white disk with center (424, 55) and radius 46.
; PLAN: r0=57(x), r1=123(y), r2=14(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x1), r6=250(y1), r7=256(x2), r8=124(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=424(x), r11=55(y), r12=46(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 123
LDI r2, 14
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 250
LDI r7, 256
LDI r8, 124
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 55
LDI r12, 46
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
