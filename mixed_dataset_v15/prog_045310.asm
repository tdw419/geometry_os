; DESCRIPTION: Renders a purple box of size 77x86 starting at (382, 165).
; PLAN: r0=382(x), r1=165(y), r2=77(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 165
LDI r2, 77
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
