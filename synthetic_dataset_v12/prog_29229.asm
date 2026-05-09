; DESCRIPTION: Composite: Places a purple line segment connecting (488, 43) to (265, 27) then Places a black 32x50 rectangle at position (229, 142) then Places a red dot at position (386, 119).
; PLAN: r0=488(x1), r1=43(y1), r2=265(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=142(y), r7=32(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=386(x), r11=119(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 488
LDI r1, 43
LDI r2, 265
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 142
LDI r7, 32
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 119
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
