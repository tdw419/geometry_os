; DESCRIPTION: Renders a red rectangular region spanning 104 by 62 at (133, 6).
; PLAN: r0=133(x), r1=6(y), r2=104(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 6
LDI r2, 104
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
