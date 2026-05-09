; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (154, 56) spanning 43 by 29 pixels. Then Renders a orange disk with center (178, 112) and radius 71.
; PLAN: r0=154(x), r1=56(y), r2=43(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=178(x), r1=112(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a blue rectangular region at (154, 56) spanning 43 by 29 pixels.
; PLAN: r0=154(x), r1=56(y), r2=43(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 56
LDI r2, 43
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (178, 112) and radius 71.
; PLAN: r0=178(x), r1=112(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 112
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
