; DESCRIPTION: Renders a red rectangular region spanning 52 by 87 at (139, 164).
; PLAN: r0=139(x), r1=164(y), r2=52(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 164
LDI r2, 52
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
