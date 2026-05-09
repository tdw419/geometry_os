; DESCRIPTION: Composite: Places a green line segment connecting (9, 154) to (186, 21) then Places a blue 35x43 rectangle at position (170, 196) then Places a orange dot at position (210, 168).
; PLAN: r0=9(x1), r1=154(y1), r2=186(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=196(y), r7=35(width), r8=43(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x), r11=168(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 154
LDI r2, 186
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 196
LDI r7, 35
LDI r8, 43
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 168
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
