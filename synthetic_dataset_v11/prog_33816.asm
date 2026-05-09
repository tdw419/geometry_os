; DESCRIPTION: Composite: . Then Renders a black disk with center (154, 61) and radius 59. Then Creates a magenta rectangular region at (45, 195) spanning 74 by 56 pixels.
; PLAN: r0=154(x), r1=61(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=45(x), r1=195(y), r2=74(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (154, 61) and radius 59.
; PLAN: r0=154(x), r1=61(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 61
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (45, 195) spanning 74 by 56 pixels.
; PLAN: r0=45(x), r1=195(y), r2=74(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 195
LDI r2, 74
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
