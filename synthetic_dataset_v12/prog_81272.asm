; DESCRIPTION: Composite: Places a magenta 93x70 rectangle at position (243, 29) then Places a orange dot at position (383, 49) then Places a yellow circle of radius 24 at center (303, 222).
; PLAN: r0=243(x), r1=29(y), r2=93(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=49(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=303(x), r11=222(y), r12=24(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 29
LDI r2, 93
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 49
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 303
LDI r11, 222
LDI r12, 24
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
