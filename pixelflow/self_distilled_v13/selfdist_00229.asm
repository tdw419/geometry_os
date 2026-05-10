; DESCRIPTION: Renders a red rectangular region spanning 56 by 45 at (77, 139).
; PLAN: r0=77(x), r1=139(y), r2=56(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 139
LDI r2, 56
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
