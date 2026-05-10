; DESCRIPTION: Composite: Renders a yellow box of size 50x58 starting at (243, 144) then Renders a yellow disk with center (43, 222) and radius 22.
; PLAN: r0=243(x), r1=144(y), r2=50(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x), r6=222(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 144
LDI r2, 50
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 222
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
