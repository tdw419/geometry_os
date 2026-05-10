; DESCRIPTION: Renders a white rectangular region spanning 117 by 56 at (30, 168).
; PLAN: r0=30(x), r1=168(y), r2=117(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 168
LDI r2, 117
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
