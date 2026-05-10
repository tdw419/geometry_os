; DESCRIPTION: Renders a blue rectangular region spanning 71 by 24 at (173, 39).
; PLAN: r0=173(x), r1=39(y), r2=71(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 39
LDI r2, 71
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
