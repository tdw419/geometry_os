; DESCRIPTION: Renders a orange box of size 77x40 starting at (326, 144).
; PLAN: r0=326(x), r1=144(y), r2=77(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 144
LDI r2, 77
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
