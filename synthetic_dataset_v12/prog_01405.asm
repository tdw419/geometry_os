; DESCRIPTION: Composite: Creates a purple rectangular region at (113, 156) spanning 97 by 91 pixels then Renders a red disk with center (213, 180) and radius 45.
; PLAN: r0=113(x), r1=156(y), r2=97(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=180(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 156
LDI r2, 97
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 180
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
