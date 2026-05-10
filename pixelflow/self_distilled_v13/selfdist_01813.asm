; DESCRIPTION: Renders a red rectangular region spanning 56 by 16 at (339, 172).
; PLAN: r0=339(x), r1=172(y), r2=56(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 172
LDI r2, 56
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
