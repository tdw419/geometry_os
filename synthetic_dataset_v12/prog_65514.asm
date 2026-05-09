; DESCRIPTION: Composite: Places a green line segment connecting (401, 118) to (263, 126) then Places a red circle of radius 25 at center (130, 111) then Renders a red box of size 63x13 starting at (291, 222).
; PLAN: r0=401(x1), r1=118(y1), r2=263(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=111(y), r7=25(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x), r11=222(y), r12=63(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 118
LDI r2, 263
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 111
LDI r7, 25
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 222
LDI r12, 63
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
