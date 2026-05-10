; DESCRIPTION: Composite: Creates a blue rectangular region at (254, 23) spanning 57 by 49 pixels then Renders a white line between points (103, 30) and (437, 149) then Sets a single orange pixel at (52, 134).
; PLAN: r0=254(x), r1=23(y), r2=57(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x1), r6=30(y1), r7=437(x2), r8=149(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=52(x), r11=134(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 254
LDI r1, 23
LDI r2, 57
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 30
LDI r7, 437
LDI r8, 149
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 134
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
