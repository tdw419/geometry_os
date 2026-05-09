; DESCRIPTION: Composite: Renders a magenta box of size 82x39 starting at (396, 142) then Places a blue circle of radius 39 at center (142, 87).
; PLAN: r0=396(x), r1=142(y), r2=82(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=87(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 142
LDI r2, 82
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 87
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
