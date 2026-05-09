; DESCRIPTION: Composite: . Then Renders a magenta disk with center (25, 130) and radius 24. Then Creates a orange rectangular region at (218, 3) spanning 30 by 77 pixels.
; PLAN: r0=25(x), r1=130(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=218(x), r1=3(y), r2=30(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (25, 130) and radius 24.
; PLAN: r0=25(x), r1=130(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 130
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a orange rectangular region at (218, 3) spanning 30 by 77 pixels.
; PLAN: r0=218(x), r1=3(y), r2=30(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 3
LDI r2, 30
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
