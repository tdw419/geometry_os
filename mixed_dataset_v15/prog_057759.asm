; DESCRIPTION: Renders a blue rectangular region spanning 86 by 64 at (116, 41).
; PLAN: r0=116(x), r1=41(y), r2=86(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 41
LDI r2, 86
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
