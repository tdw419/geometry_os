; DESCRIPTION: Renders a red rectangular region spanning 53 by 44 at (207, 61).
; PLAN: r0=207(x), r1=61(y), r2=53(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 61
LDI r2, 53
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
