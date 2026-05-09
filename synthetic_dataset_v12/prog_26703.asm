; DESCRIPTION: Composite: Renders a yellow disk with center (295, 176) and radius 67 then Creates a red rectangular region at (243, 84) spanning 54 by 112 pixels.
; PLAN: r0=295(x), r1=176(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=84(y), r7=54(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 176
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 84
LDI r7, 54
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
