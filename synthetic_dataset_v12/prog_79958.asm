; DESCRIPTION: Composite: Creates a cyan circular shape at (146, 147) with radius 67 then Draws a yellow rectangle at (416, 130) with width 18 and height 61.
; PLAN: r0=146(x), r1=147(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=130(y), r7=18(width), r8=61(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 147
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 130
LDI r7, 18
LDI r8, 61
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
