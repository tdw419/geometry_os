; DESCRIPTION: Renders a magenta circular shape at (391, 173) with radius 68.
; PLAN: r0=391(x), r1=173(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 173
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
