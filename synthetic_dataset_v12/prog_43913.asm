; DESCRIPTION: Composite: Creates a yellow rectangular region at (299, 63) spanning 112 by 78 pixels then Places a yellow dot at position (159, 196) then Places a purple line segment connecting (146, 106) to (105, 246).
; PLAN: r0=299(x), r1=63(y), r2=112(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=196(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=146(x1), r11=106(y1), r12=105(x2), r13=246(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 63
LDI r2, 112
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 196
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 146
LDI r11, 106
LDI r12, 105
LDI r13, 246
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
