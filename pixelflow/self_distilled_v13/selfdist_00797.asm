; DESCRIPTION: Renders a white rectangular region spanning 93 by 38 at (276, 178).
; PLAN: r0=276(x), r1=178(y), r2=93(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 178
LDI r2, 93
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
