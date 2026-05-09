; DESCRIPTION: Renders a blue box of size 28x107 starting at (239, 47).
; PLAN: r0=239(x), r1=47(y), r2=28(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 47
LDI r2, 28
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
