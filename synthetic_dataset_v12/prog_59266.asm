; DESCRIPTION: Composite: Renders a green disk with center (224, 208) and radius 47 then Draws a cyan rectangle at (367, 62) with width 22 and height 17.
; PLAN: r0=224(x), r1=208(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=62(y), r7=22(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 208
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 62
LDI r7, 22
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
