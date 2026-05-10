; DESCRIPTION: Renders a red rectangular region spanning 17 by 104 at (5, 140).
; PLAN: r0=5(x), r1=140(y), r2=17(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 140
LDI r2, 17
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
