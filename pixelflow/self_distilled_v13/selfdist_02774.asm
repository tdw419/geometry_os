; DESCRIPTION: Renders a yellow rectangular region spanning 21 by 30 at (342, 21).
; PLAN: r0=342(x), r1=21(y), r2=21(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 21
LDI r2, 21
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
