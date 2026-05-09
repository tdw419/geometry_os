; DESCRIPTION: Renders a green box of size 39x76 starting at (397, 175).
; PLAN: r0=397(x), r1=175(y), r2=39(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 175
LDI r2, 39
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
