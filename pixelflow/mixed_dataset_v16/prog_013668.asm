; DESCRIPTION: Composite: Renders a green box of size 48x91 starting at (137, 112) then Draws a green circle centered at (470, 96) with radius 12.
; PLAN: r0=137(x), r1=112(y), r2=48(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=96(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 137
LDI r1, 112
LDI r2, 48
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 96
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
