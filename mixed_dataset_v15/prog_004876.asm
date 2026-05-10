; DESCRIPTION: Composite: Places a red 10x97 rectangle at position (303, 151) then Renders a black line between points (45, 171) and (442, 114) then Sets a single blue pixel at (435, 128).
; PLAN: r0=303(x), r1=151(y), r2=10(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x1), r6=171(y1), r7=442(x2), r8=114(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=128(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 151
LDI r2, 10
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 171
LDI r7, 442
LDI r8, 114
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 128
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
