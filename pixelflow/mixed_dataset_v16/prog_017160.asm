; DESCRIPTION: Renders a purple box of size 62x102 starting at (217, 128).
; PLAN: r0=217(x), r1=128(y), r2=62(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 128
LDI r2, 62
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
