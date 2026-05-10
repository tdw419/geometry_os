; DESCRIPTION: Renders a white rectangular region spanning 28 by 64 at (0, 99).
; PLAN: r0=0(x), r1=99(y), r2=28(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 99
LDI r2, 28
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
