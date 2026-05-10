; DESCRIPTION: Composite: Renders a green disk with center (46, 135) and radius 36 then Creates a red rectangular region at (267, 55) spanning 101 by 44 pixels.
; PLAN: r0=46(x), r1=135(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=55(y), r7=101(width), r8=44(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 135
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 55
LDI r7, 101
LDI r8, 44
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
