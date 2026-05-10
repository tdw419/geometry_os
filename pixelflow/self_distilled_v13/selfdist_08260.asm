; DESCRIPTION: Renders a white rectangular region spanning 57 by 30 at (333, 163).
; PLAN: r0=333(x), r1=163(y), r2=57(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 163
LDI r2, 57
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
