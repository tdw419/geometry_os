; DESCRIPTION: Composite: Places a purple dot at position (168, 244) then Renders a red box of size 74x80 starting at (80, 103) then Creates a yellow circular shape at (34, 50) with radius 29.
; PLAN: r0=168(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=103(y), r7=74(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x), r11=50(y), r12=29(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 168
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 103
LDI r7, 74
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 50
LDI r12, 29
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
