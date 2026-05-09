; DESCRIPTION: Composite: Renders a magenta box of size 88x113 starting at (378, 31) then Renders a green disk with center (290, 146) and radius 59.
; PLAN: r0=378(x), r1=31(y), r2=88(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x), r6=146(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 31
LDI r2, 88
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 146
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
