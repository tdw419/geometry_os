; DESCRIPTION: Renders a red rectangular region spanning 12 by 45 at (357, 84).
; PLAN: r0=357(x), r1=84(y), r2=12(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 84
LDI r2, 12
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
