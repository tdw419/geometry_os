; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (127, 164) spanning 36 by 56 pixels. Then Renders a black disk with center (74, 106) and radius 23.
; PLAN: r0=127(x), r1=164(y), r2=36(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=74(x), r1=106(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (127, 164) spanning 36 by 56 pixels.
; PLAN: r0=127(x), r1=164(y), r2=36(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 164
LDI r2, 36
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (74, 106) and radius 23.
; PLAN: r0=74(x), r1=106(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 106
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
