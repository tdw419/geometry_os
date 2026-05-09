; DESCRIPTION: Composite: Places a cyan 14x83 rectangle at position (254, 5) then Sets a single red pixel at (98, 123) then Renders a green line between points (152, 86) and (175, 43).
; PLAN: r0=254(x), r1=5(y), r2=14(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=123(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=152(x1), r11=86(y1), r12=175(x2), r13=43(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 5
LDI r2, 14
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 123
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 152
LDI r11, 86
LDI r12, 175
LDI r13, 43
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
