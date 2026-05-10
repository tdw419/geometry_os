; DESCRIPTION: Renders a red rectangular region spanning 30 by 72 at (222, 55).
; PLAN: r0=222(x), r1=55(y), r2=30(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 55
LDI r2, 30
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
