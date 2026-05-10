; DESCRIPTION: Renders a blue box of size 111x56 starting at (320, 165).
; PLAN: r0=320(x), r1=165(y), r2=111(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 165
LDI r2, 111
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
