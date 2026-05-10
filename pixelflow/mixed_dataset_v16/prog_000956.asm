; DESCRIPTION: Renders a white rectangular region spanning 21 by 93 at (315, 173).
; PLAN: r0=315(x), r1=173(y), r2=21(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 173
LDI r2, 21
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
