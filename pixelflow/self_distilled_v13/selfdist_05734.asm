; DESCRIPTION: Renders a yellow rectangular region spanning 84 by 65 at (397, 173).
; PLAN: r0=397(x), r1=173(y), r2=84(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 173
LDI r2, 84
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
