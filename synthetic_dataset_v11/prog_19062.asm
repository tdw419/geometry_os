; DESCRIPTION: Composite: . Then Renders a white disk with center (146, 129) and radius 43. Then Creates a white rectangular region at (123, 183) spanning 111 by 56 pixels.
; PLAN: r0=146(x), r1=129(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=123(x), r1=183(y), r2=111(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (146, 129) and radius 43.
; PLAN: r0=146(x), r1=129(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 129
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (123, 183) spanning 111 by 56 pixels.
; PLAN: r0=123(x), r1=183(y), r2=111(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 183
LDI r2, 111
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
