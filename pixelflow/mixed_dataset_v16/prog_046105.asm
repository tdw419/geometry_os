; DESCRIPTION: Renders a purple rectangular region spanning 86 by 116 at (333, 21).
; PLAN: r0=333(x), r1=21(y), r2=86(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 21
LDI r2, 86
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
