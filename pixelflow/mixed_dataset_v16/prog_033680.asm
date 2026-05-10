; DESCRIPTION: Renders a white box of size 71x11 starting at (418, 155).
; PLAN: r0=418(x), r1=155(y), r2=71(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 155
LDI r2, 71
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
