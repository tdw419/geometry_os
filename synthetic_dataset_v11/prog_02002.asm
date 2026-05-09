; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (136, 68) spanning 89 by 91 pixels. Then Draws a green circle centered at (175, 154) with radius 68.
; PLAN: r0=136(x), r1=68(y), r2=89(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=154(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (136, 68) spanning 89 by 91 pixels.
; PLAN: r0=136(x), r1=68(y), r2=89(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 68
LDI r2, 89
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (175, 154) with radius 68.
; PLAN: r0=175(x), r1=154(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 154
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
