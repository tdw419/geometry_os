; DESCRIPTION: Composite: Draws a green line from (280, 229) to (350, 254) then Creates a red circular shape at (118, 148) with radius 27 then Renders a red box of size 57x30 starting at (328, 6).
; PLAN: r0=280(x1), r1=229(y1), r2=350(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=148(y), r7=27(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=328(x), r11=6(y), r12=57(width), r13=30(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 229
LDI r2, 350
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 148
LDI r7, 27
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 328
LDI r11, 6
LDI r12, 57
LDI r13, 30
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
