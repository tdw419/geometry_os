; DESCRIPTION: Composite: Places a magenta circle of radius 12 at center (422, 136) then Creates a orange rectangular region at (118, 141) spanning 57 by 85 pixels.
; PLAN: r0=422(x), r1=136(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=141(y), r7=57(width), r8=85(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 136
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 141
LDI r7, 57
LDI r8, 85
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
