; DESCRIPTION: Composite: Creates a red circular shape at (404, 125) with radius 70 then Renders a red box of size 65x59 starting at (335, 81) then Renders a blue line between points (184, 40) and (452, 222).
; PLAN: r0=404(x), r1=125(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=81(y), r7=65(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x1), r11=40(y1), r12=452(x2), r13=222(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 125
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 81
LDI r7, 65
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 40
LDI r12, 452
LDI r13, 222
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
