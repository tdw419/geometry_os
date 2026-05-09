; DESCRIPTION: Composite: Creates a magenta circular shape at (429, 140) with radius 33 then Renders a yellow box of size 39x72 starting at (79, 162).
; PLAN: r0=429(x), r1=140(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=162(y), r7=39(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 140
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 162
LDI r7, 39
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
