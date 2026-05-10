; DESCRIPTION: Composite: Places a orange 110x69 rectangle at position (39, 115) then Sets a single yellow pixel at (284, 150) then Renders a yellow disk with center (52, 56) and radius 28.
; PLAN: r0=39(x), r1=115(y), r2=110(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=150(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=52(x), r11=56(y), r12=28(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 115
LDI r2, 110
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 150
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 52
LDI r11, 56
LDI r12, 28
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
