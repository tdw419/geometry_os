; DESCRIPTION: Renders a blue box of size 107x38 starting at (225, 203).
; PLAN: r0=225(x), r1=203(y), r2=107(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 203
LDI r2, 107
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
