; DESCRIPTION: Renders a white rectangular region spanning 44 by 84 at (74, 48).
; PLAN: r0=74(x), r1=48(y), r2=44(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 48
LDI r2, 44
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
