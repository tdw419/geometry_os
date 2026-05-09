; DESCRIPTION: Renders a blue box of size 91x50 starting at (372, 203).
; PLAN: r0=372(x), r1=203(y), r2=91(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 203
LDI r2, 91
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
