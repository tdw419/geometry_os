; DESCRIPTION: Composite: Places a blue dot at position (466, 217) then Places a red 86x26 rectangle at position (175, 52) then Places a magenta circle of radius 46 at center (464, 152).
; PLAN: r0=466(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=52(y), r7=86(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=464(x), r11=152(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 52
LDI r7, 86
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 152
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
