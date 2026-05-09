; DESCRIPTION: Composite: . Then Renders a blue disk with center (166, 89) and radius 48. Then Creates a white rectangular region at (68, 18) spanning 32 by 57 pixels.
; PLAN: r0=166(x), r1=89(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=68(x), r1=18(y), r2=32(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (166, 89) and radius 48.
; PLAN: r0=166(x), r1=89(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 89
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (68, 18) spanning 32 by 57 pixels.
; PLAN: r0=68(x), r1=18(y), r2=32(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 18
LDI r2, 32
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
