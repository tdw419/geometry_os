; DESCRIPTION: Composite: Places a cyan line segment connecting (37, 157) to (175, 239) then Places a blue 54x111 rectangle at position (332, 48) then Places a green dot at position (3, 90).
; PLAN: r0=37(x1), r1=157(y1), r2=175(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=48(y), r7=54(width), r8=111(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=3(x), r11=90(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 157
LDI r2, 175
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 48
LDI r7, 54
LDI r8, 111
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 90
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
