; DESCRIPTION: Composite: Places a green line segment connecting (311, 187) to (277, 171) then Renders a cyan disk with center (121, 181) and radius 60 then Creates a cyan rectangular region at (60, 43) spanning 115 by 49 pixels.
; PLAN: r0=311(x1), r1=187(y1), r2=277(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=181(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x), r11=43(y), r12=115(width), r13=49(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 187
LDI r2, 277
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 181
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 43
LDI r12, 115
LDI r13, 49
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
