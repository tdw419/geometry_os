; DESCRIPTION: Composite: Draws a white circle centered at (191, 193) with radius 47 then Creates a magenta rectangular region at (197, 0) spanning 91 by 98 pixels.
; PLAN: r0=191(x), r1=193(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=0(y), r7=91(width), r8=98(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 193
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 0
LDI r7, 91
LDI r8, 98
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
