; DESCRIPTION: Composite: Draws a green circle centered at (246, 146) with radius 47 then Renders a green box of size 91x117 starting at (43, 18).
; PLAN: r0=246(x), r1=146(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=18(y), r7=91(width), r8=117(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 146
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 18
LDI r7, 91
LDI r8, 117
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
