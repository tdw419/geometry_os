; DESCRIPTION: Composite: Places a cyan 99x32 rectangle at position (33, 157) then Places a blue line segment connecting (482, 105) to (447, 4) then Sets a single black pixel at (30, 234).
; PLAN: r0=33(x), r1=157(y), r2=99(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=105(y1), r7=447(x2), r8=4(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=30(x), r11=234(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 33
LDI r1, 157
LDI r2, 99
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 105
LDI r7, 447
LDI r8, 4
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 234
LDI r12, 0x000000
PSET r10, r11, r12
HALT
