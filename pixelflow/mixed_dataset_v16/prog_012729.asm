; DESCRIPTION: Composite: Places a white line segment connecting (480, 165) to (384, 193) then Renders a white box of size 30x69 starting at (248, 168) then Creates a cyan circular shape at (18, 220) with radius 16.
; PLAN: r0=480(x1), r1=165(y1), r2=384(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=168(y), r7=30(width), r8=69(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=18(x), r11=220(y), r12=16(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 480
LDI r1, 165
LDI r2, 384
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 168
LDI r7, 30
LDI r8, 69
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 220
LDI r12, 16
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
