; DESCRIPTION: Composite: Places a magenta line segment connecting (14, 210) to (325, 241) then Renders a white box of size 120x39 starting at (265, 173) then Renders a green disk with center (274, 93) and radius 30.
; PLAN: r0=14(x1), r1=210(y1), r2=325(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=173(y), r7=120(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=274(x), r11=93(y), r12=30(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 14
LDI r1, 210
LDI r2, 325
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 173
LDI r7, 120
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 93
LDI r12, 30
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
