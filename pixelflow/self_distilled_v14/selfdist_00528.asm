; DESCRIPTION: Renders a white rectangular region spanning 44 by 72 at (238, 195).
; PLAN: r0=238(x), r1=195(y), r2=44(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 195
LDI r2, 44
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
