; DESCRIPTION: Renders a white rectangular region spanning 25 by 53 at (323, 65).
; PLAN: r0=323(x), r1=65(y), r2=25(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 65
LDI r2, 25
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
