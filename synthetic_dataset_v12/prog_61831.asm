; DESCRIPTION: Composite: Creates a cyan rectangular region at (302, 5) spanning 67 by 110 pixels then Places a green line segment connecting (425, 20) to (251, 220) then Renders a white disk with center (153, 189) and radius 64.
; PLAN: r0=302(x), r1=5(y), r2=67(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x1), r6=20(y1), r7=251(x2), r8=220(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=189(y), r12=64(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 5
LDI r2, 67
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 20
LDI r7, 251
LDI r8, 220
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 189
LDI r12, 64
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
