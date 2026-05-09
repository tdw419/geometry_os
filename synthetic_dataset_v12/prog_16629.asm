; DESCRIPTION: Renders a black box of size 84x16 starting at (409, 217).
; PLAN: r0=409(x), r1=217(y), r2=84(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 217
LDI r2, 84
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
