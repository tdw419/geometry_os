; DESCRIPTION: Composite: Places a blue 48x76 rectangle at position (69, 144) then Renders a green line between points (273, 239) and (285, 158) then Places a blue circle of radius 45 at center (434, 194).
; PLAN: r0=69(x), r1=144(y), r2=48(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x1), r6=239(y1), r7=285(x2), r8=158(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=194(y), r12=45(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 144
LDI r2, 48
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 239
LDI r7, 285
LDI r8, 158
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 194
LDI r12, 45
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
