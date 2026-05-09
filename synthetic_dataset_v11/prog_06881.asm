; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (102, 76) spanning 104 by 104 pixels. Then Renders a green disk with center (94, 191) and radius 29.
; PLAN: r0=102(x), r1=76(y), r2=104(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=94(x), r1=191(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a yellow rectangular region at (102, 76) spanning 104 by 104 pixels.
; PLAN: r0=102(x), r1=76(y), r2=104(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 76
LDI r2, 104
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (94, 191) and radius 29.
; PLAN: r0=94(x), r1=191(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 191
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
