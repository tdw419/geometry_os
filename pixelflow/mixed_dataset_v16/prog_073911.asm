; DESCRIPTION: Renders a magenta rectangular region spanning 33 by 104 at (1, 194).
; PLAN: r0=1(x), r1=194(y), r2=33(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 194
LDI r2, 33
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
