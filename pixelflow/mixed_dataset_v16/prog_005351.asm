; DESCRIPTION: Composite: Places a green line segment connecting (242, 70) to (21, 168) then Creates a green rectangular region at (402, 127) spanning 75 by 24 pixels then Renders a green disk with center (315, 164) and radius 63.
; PLAN: r0=242(x1), r1=70(y1), r2=21(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=127(y), r7=75(width), r8=24(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=164(y), r12=63(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 70
LDI r2, 21
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 127
LDI r7, 75
LDI r8, 24
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 164
LDI r12, 63
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
