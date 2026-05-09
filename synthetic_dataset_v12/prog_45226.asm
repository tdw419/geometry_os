; DESCRIPTION: Composite: Draws a yellow circle centered at (123, 145) with radius 66 then Renders a green box of size 65x27 starting at (302, 30).
; PLAN: r0=123(x), r1=145(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=30(y), r7=65(width), r8=27(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 145
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 30
LDI r7, 65
LDI r8, 27
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
