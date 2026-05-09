; DESCRIPTION: Composite: Renders a white box of size 106x13 starting at (346, 113) then Places a green line segment connecting (7, 239) to (109, 52) then Places a purple circle of radius 45 at center (410, 92).
; PLAN: r0=346(x), r1=113(y), r2=106(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x1), r6=239(y1), r7=109(x2), r8=52(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=410(x), r11=92(y), r12=45(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 346
LDI r1, 113
LDI r2, 106
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 239
LDI r7, 109
LDI r8, 52
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 92
LDI r12, 45
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
