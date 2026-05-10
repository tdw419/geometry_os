; DESCRIPTION: Composite: Creates a orange rectangular region at (228, 136) spanning 45 by 56 pixels then Places a black line segment connecting (421, 98) to (213, 171).
; PLAN: r0=228(x), r1=136(y), r2=45(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x1), r6=98(y1), r7=213(x2), r8=171(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 136
LDI r2, 45
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 98
LDI r7, 213
LDI r8, 171
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
