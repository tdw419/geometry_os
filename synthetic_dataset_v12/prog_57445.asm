; DESCRIPTION: Renders a blue box of size 96x39 starting at (382, 178).
; PLAN: r0=382(x), r1=178(y), r2=96(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 178
LDI r2, 96
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
