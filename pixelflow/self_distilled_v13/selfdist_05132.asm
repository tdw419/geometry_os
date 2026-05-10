; DESCRIPTION: Renders a yellow rectangular region spanning 32 by 112 at (253, 60).
; PLAN: r0=253(x), r1=60(y), r2=32(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 60
LDI r2, 32
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
