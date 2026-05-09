; DESCRIPTION: Composite: Renders a cyan box of size 65x113 starting at (224, 69) then Places a cyan line segment connecting (12, 111) to (30, 204) then Renders a purple disk with center (451, 154) and radius 41.
; PLAN: r0=224(x), r1=69(y), r2=65(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x1), r6=111(y1), r7=30(x2), r8=204(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=451(x), r11=154(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 224
LDI r1, 69
LDI r2, 65
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 111
LDI r7, 30
LDI r8, 204
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 154
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
