; DESCRIPTION: Renders a purple box of size 91x107 starting at (320, 135).
; PLAN: r0=320(x), r1=135(y), r2=91(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 135
LDI r2, 91
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
