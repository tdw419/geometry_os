; DESCRIPTION: Composite: Creates a green circular shape at (202, 206) with radius 46 then Draws a purple rectangle at (431, 61) with width 44 and height 67.
; PLAN: r0=202(x), r1=206(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=61(y), r7=44(width), r8=67(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 206
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 61
LDI r7, 44
LDI r8, 67
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
