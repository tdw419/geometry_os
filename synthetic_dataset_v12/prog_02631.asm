; DESCRIPTION: Composite: Renders a cyan box of size 83x110 starting at (144, 0) then Places a white line segment connecting (1, 148) to (465, 64) then Places a yellow circle of radius 70 at center (208, 70).
; PLAN: r0=144(x), r1=0(y), r2=83(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x1), r6=148(y1), r7=465(x2), r8=64(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=70(y), r12=70(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 144
LDI r1, 0
LDI r2, 83
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 148
LDI r7, 465
LDI r8, 64
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 70
LDI r12, 70
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
