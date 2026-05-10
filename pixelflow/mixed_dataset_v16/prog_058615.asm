; DESCRIPTION: Renders a white rectangular region spanning 40 by 80 at (380, 132).
; PLAN: r0=380(x), r1=132(y), r2=40(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 132
LDI r2, 40
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
